using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TargetSpawner : MonoBehaviour
{
    public GameObject[] prefabs;
    public float minDelay = 2.0f;
    public float maxDelay = 4.0f;
    public float initialDelay;
    private float _delay;
    public bool active = true;
    public float zLayer;

    void Start()
    {
        _delay = initialDelay;
        StartCoroutine(TargetGenerator());
    }

    private IEnumerator TargetGenerator()
    {
        yield return new WaitForSeconds(_delay);

        if (active)
        {
            var prefab = prefabs[Random.Range(0, prefabs.Length)];
            var position = new Vector3(transform.position.x, transform.position.y, zLayer); 

            Instantiate(prefab, position, Quaternion.identity);
            ResetDelay();
        }

        StartCoroutine(TargetGenerator());
    }

    private void ResetDelay()
    {
        _delay = Random.Range(minDelay, maxDelay);
    }
}
