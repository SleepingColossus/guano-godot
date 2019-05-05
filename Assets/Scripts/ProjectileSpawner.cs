using System;
using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;

public class ProjectileSpawner : MonoBehaviour
{
    public GameObject projectilePrefab;
    public GameState gameState;

    private float _deathDelay = 3.0f;

    private void Update()
    {
        if (Input.anyKeyDown && gameState.ammo > 0)
        {
            gameState.UpdateAmmo(-1);
            Spawn();
        }

        if (gameState.ammo <= 0)
        {
            StartCoroutine(DieIfAmmoNotCollected());
        }
    }

    public void Spawn()
    {
        Instantiate(projectilePrefab, transform.position, Quaternion.identity);
    }

    private IEnumerator DieIfAmmoNotCollected()
    {
        yield return new WaitForSeconds(_deathDelay);

        if (gameState.ammo <= 0)
        {
            SceneManager.LoadScene("GameOver");
        }
    }
}
