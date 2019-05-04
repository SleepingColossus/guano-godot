using System;
using UnityEngine;

public class ProjectileSpawner : MonoBehaviour
{
    public GameObject projectilePrefab;

    private void Update()
    {
        if (Input.anyKeyDown)
        {
            Spawn();
        }
    }

    public void Spawn()
    {
        Instantiate(projectilePrefab, transform.position, Quaternion.identity);
    }
}
