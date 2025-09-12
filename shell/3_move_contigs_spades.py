import argparse
import os
import shutil

def move_and_rename_contigs(source_dir, destination_dir):
    # destination directory exists
    os.makedirs(destination_dir, exist_ok=True)
    
    # Iterate over folders in the source directory
    for folder_name in os.listdir(source_dir):
        folder_path = os.path.join(source_dir, folder_name)

        # Check if it's a directory
        if os.path.isdir(folder_path):
            parts = folder_name.split('_')

            # Adjust this line naming
            if len(parts) > 1:
                new_file_name = f"{parts[1]}.contig.fasta"

                source_file = os.path.join(folder_path, "contigs.fasta")
                destination_file = os.path.join(destination_dir, new_file_name)

                # Check if the source file exists
                if os.path.isfile(source_file):
                    shutil.copy(source_file, destination_file)
                    print(f"Copied and renamed {source_file} to {destination_file}")
                else:
                    print(f"{source_file} does not exist.")

def main():
    # user input for command line
    parser = argparse.ArgumentParser(description='Move and rename contigs from SPAdes output folders.')
    parser.add_argument('-i', '--input', required=True, help='Path to the SPAdes output directory')
    parser.add_argument('-o', '--output', required=True, help='Path to the destination directory for contigs')

    args = parser.parse_args()

    # function
    move_and_rename_contigs(args.input, args.output)

if __name__ == '__main__':
    main()
