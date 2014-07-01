## Reconstructing the Electrode Trajectory

Once normalized volumes are found within the chosen patient folder, the images are ready to be used for reconstruction of the electrode trajectories and for manual correction.

#### Reconstructing Electrode Lead Trajectories
For the reconstruction step to take place, check the box `[] Reconstruct`, choose the preferred parameters for obtaining the images, and press `Run`.

**IMPORTANT:**
Always pay attention to the checkboxes. Remember that _Lead-DBS_ runs all processes that are checked!

#### Reconstruction Parameters

To perform a reconstruction as precise as possible, _Lead-DBS_ uses the different planes to pinpoint the artifacts caused by the electrodes and calculates thereafter the trajectories through space. You can choose to reconstruct one or both hemispheres (`[] LH`and `[] RH` checkboxes).

Several options are available to help in this process:

##### 1. Entry point for electrodes
The parameter `Entry point for electrodes` presents following options:
```
- STN, GPi, or ViM
- Cg25
- Manual
```

An **automatic ** reconstruction will be performed if any of the first two options are chosen. The option `STN, GPi, or ViM` targets electrodes that have been implanted in patients with movement disorders. The option `Cg25`targets those in patients with depression.

The option `Manual` will require you to pinpoint the entry points of the artifacts within the image slices. **Section 4.2** describes the details for this step.

##### 2. Axis

The parameter `Axis` determines the image planes that _Lead-DBS_ will use to locate the electrode. The following options are available:
```
- Use transversal image only
- Use transversal but smooth
- Use average of coronal and transversal, smoothed
```

##### 3. Mask window size
The default option is an **auto** window size. This has proven to give good results in the reconstruction.

However, numeric values (best results obtained from **5** to **15**) can be entered to fix the size of the mask. A smaller mask will avoid nearby structures that could interfere in the reconstruction step. If the image shows large artifacts, e.g. due to local edema, a larger mask should be chosen (e.g. enter `15` instead of `auto`). If the image is noisy, a smaller mask (e.g. `5` or `7`) might be of better use.


