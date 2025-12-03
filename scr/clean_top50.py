import pandas as pd

def clean_top50_first3_cols(df: pd.DataFrame) -> pd.DataFrame:
    """
    Clean the first three columns of the top 50 dataset:
    - Delete 'Unnamed: 0'
    - Rename 'Track.Name' and 'Artist.Name'
    - Clean 'Track_Name' and 'Artist_Name'
    - Add a Rank column (from 1 to n)
    """
    df = df.copy()

    # delete Unnamed: 0
    if 'Unnamed: 0' in df.columns:
        df = df.drop(columns=['Unnamed: 0'])

    # rename columns
    df = df.rename(columns={
        'Track.Name': 'Track_Name',
        'Artist.Name': 'Artist_Name'
    })

    # clean string columns
    str_cols = ['Track_Name', 'Artist_Name']
    for col in str_cols:
        if col in df.columns:
            df[col] = df[col].astype(str).str.strip()
            df[col] = df[col].str.replace(r'\s+', ' ', regex=True)

    #clean numeric data
    numeric_mask = df['Track_Name'].str.match(r'^\d+(\.\d+)?$', na=False)
    df.loc[numeric_mask, 'Track_Name'] = "Unknown"

    # drop duplicates based on renamed columns
    df = df.drop_duplicates(subset=['Track_Name', 'Artist_Name'])

    # rebuild Rank (ensure 1…n and place it in the first column)
    df.insert(0, 'Rank', range(1, len(df) + 1))

    return df

