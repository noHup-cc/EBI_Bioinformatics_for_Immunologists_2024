# Course Materials for Bioinformatics for Immunologists 2024 at EMBL-EBI

As part of the [Bioinformatics for immunologists 2024](https://www.ebi.ac.uk/training/events/bioinformatics-immunologists-0/) at the European Bioinformatics Institute (EMBL-EBI), this course is prepared and delivered by [Jiawei Wang](http://jiawei.nohup.cc/) at EMBL-EBI, with the assistance of `Jinzheng Ren` from the Australian National University.

## Overall Structure

### `demonstration/`

Contains all files necessary for conducting demonstration practices.

1.  **`Intro_to_UNIX_and_bash_shell/`**
2.  **`Intro_to_R/`**
3.  **`Data_visualisation_using_ggplot2/`**
4.  **`Intro_to_Git/`**
5.  **`scRNA-seq_data_analysis/`**

Each folder contains the necessary `.Rmd` script files and `.csv` files for running the exercises.

Particularly in the **`scRNA-seq_data_analysis/`** directory, you will find three `.Rmd` files for analyzing scRNA-seq data:

-   3k PBMCs from a Healthy Donor (as demonstration)

-   33k PBMCs from a Healthy Donor (as a practice project)

-   Human Squamous Cell Lung Carcinoma DTCs (as a practice project)

As the datasets are too large to upload to the GitHub repository, they are shared via the following link:

-   <https://drive.google.com/drive/folders/1C08NvlCumWTqepZNE7B0UcddcgYR8jTP?usp=sharing>

Please download the data, unzip them, and place them in the appropriate folders as follows:

-   `demonstration/scRNA-seq_data_analysis/data/pbmc3k/`
-   `demonstration/scRNA-seq_data_analysis/data/pbmc33k/`
-   `demonstration/scRNA-seq_data_analysis/data/lung_cancer/`

Alternatively, you can also download datasets from their original websites:

-   3k PBMCs from a Healthy Donor: <https://cf.10xgenomics.com/samples/cell/pbmc3k/pbmc3k_filtered_gene_bc_matrices.tar.gz>

-   33k PBMCs from a Healthy Donor (please download the Feature / cell matrix (filtered) file): <https://www.10xgenomics.com/datasets/3k-human-squamous-cell-lung-carcinoma-dtcs-chromium-x-2-standard>

-   3k Human Squamous Cell Lung Carcinoma DTCs, Chromium X (please download the Feature / cell matrix (filtered) file): <https://www.10xgenomics.com/datasets/3k-human-squamous-cell-lung-carcinoma-dtcs-chromium-x-2-standard>

### `slides/`

Contains all the slides relevant to the course content.

## Acknowledgement

Slides and demonstration materials are adapted from many great existing resources, with credits given in the relevant documents. Additionally, we extend our gratitude to the participants of this course at EMBL-EBI for their questions, advice, and discussions, which have greatly enhanced the quality of this course and helped refine the materials substantially.
