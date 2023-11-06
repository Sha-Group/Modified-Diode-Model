# Modified Detailed Balance Model
![License](https://img.shields.io/badge/license-GPL3.0-orange)
![Version](https://img.shields.io/github/v/release/WPT-Lab124/Modified-Detailed-Balance-Model)
[![Visits Badge](https://badges.strrl.dev/visits/WPT-Lab124/Modified-Detailed-Balance-Model)](https://github.com/WPT-Lab124/Modified-Detailed-Balance-Model)

The source code for the modified detailed balance (MDB) model written in MATLAB (version: R2022b).

You can use the MDB model to discern and quantify the electrical losses in a complete perovskite photovoltaic device under operational conditions. The code in this repository, along with the drift-diffusion simulation data, can reproduce the results in our paper, which validates the effectiveness of this approach.

If you require any further information or if we can be of any assistance, feel free to contact us by creating an [issue](https://github.com/WPT-Lab124/Modified-Detailed-Balance-Model/issues) or send us emails.

## Info
***Repository Structure***
```
├── Classes and Functions
│   ├── Models
│   │   ├── DataLoader.m               <- DataLoader class for loading the simulation dataset
│   │   ├── DataPreconditioner.m       <- DataPreconditioner class for the preconditioning of the simulation/experimental data
│   │   ├── Device.m                   <- Device class for defining perovskite PV parameters
│   └── Utils
│   │   ├── costFunction.m             <- Function for computing the cost function
│   │   ├── fittingMDB.m               <- Function for curve fitting with the MDB model
│   │   ├── lossAnalysis.m             <- Function for evaluating the normalized PCE gains
│   │   ├── plotJrecV.m                <- Function for plotting the J(recombination)-V curves
│   │   ├── plotJV.m                   <- Function for plotting the J-V curves
│   │   ├── plotNormPCEGain.m          <- Function for graphing the normalized PCE gains
│   │   ├── solver.m                   <- Function for solving the JV curves with the retrieved parameters from the MDB model
├── Experimental Data                  <- Experimental JV data, demonstrating how the data should be formatted
├── Simulation Data                    <- SCAPS-1D simulated JV data
│   ├── Figure1
│   └── Figure4
├── single_dataset_fitting.m           <- Script for applying the MDB model to the simulated single dataset
├── batch_dataset_fitting.m            <- Script for applying the MDB model to the simulated batch dataset
└── main.m                             <- Script for applying the MDB model to the experimental JV data
```

***Content summary***

Files in the **root** of this repository:
- `main.m` is a script where the MDB model is applied to the experimental JV data for loss quantification.
- `single_dataset_fitting.m` is a script where the MDB model is applied to one set of simulated JV curve, reproducing the results in Fig. 1 of our paper.
- `batch_dataset_fitting.m` is a script where the MDB model is applied to a batch of simulated JV curves, reproducing the results in Fig. 4 of our paper.

Files in the **Simulation Data** folder:
- **Figure1** is a folder that contains the JV curve (simulated by SCAPS-1D) under both 1 Sun and 50 Suns illumination. Using the data in this folder with `single_dataset_fitting.m` script, you can reproduce the results in Fig. 1 of our paper.
- **Figure4** is a folder that contains batches of JV curves (simulated by SCAPS-1D). These data are simulated by varing the parameters related bulk and interface SRH recombination simultaneously, in order to study their impact on the performace of the MDB model. Using the data in this folder with `batch_dataset_fitting.m` script, you can reproduce the results in Fig. 4 of our paper.

Files in the **Experimental Data** folder contains the experimental JV data, intended to show how the data should be formatted to interface with the `main.m` script.

## Usage

To get started, you can run the `main.m` script with the your experimental JV data (the format of the data should comply with those in the `Experimental Data` folder). The workflow of the script can be summarized as the following steps:

- First, initialize a `Device` object in which you can specify the parameters of your photovoltaic device.
- Second, initilize a `DataPreconditioner` object that can parse the JV data and store it into the expected format.
- Third, solve the nonlinear least squares fitting problem using the `fittingMDB` function.
- After retrieveing the model parameters, numerically solve the JV curve with `solver` function and plot it with `plotJV`.
- Finally, compute the normalized PCE gains with `lossanalysis` function and create a bar graph with `plotNormPCEGain`.

You can refer to these steps to write your own script, and follow the guidelines in our paper to apply the MDB model and interpret the results for your own device.

Besides, you can directly run the `single_dataset_fitting.m` or the `batch_dataset_fitting.m` to reproduce the results in our paper, and if you want to further explore the MDB model with SCAPS-1D, you can use the `DataSet` and the `DataPreconditioner` classes to parse the simulated data.

## Other Info

Author of the repository: Minshen Lin

Email: linminshen@zju.edu.cn

Institution: Zhejiang University

External link: The link of the paper will be updated after publication.