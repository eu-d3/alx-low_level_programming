#include "lists.h"

/**
 * add_dnodeint_end - Adds a new node to the end of a double linked list.
 *
 * @head: Double pointer to the the beginning of the double linked list.
 * @n: The value that the new node will contain.
 *
 * Return: The address of the new node, or NULL upon failure.
 */
dlistint_t *add_dnodeint_end(dlistint_t **head, const int n)
{
	dlistint_t *new;
	dlistint_t *last;

	if (head == NULL)
		return (NULL);

	new = malloc(sizeof(dlistint_t));
	if (new == NULL)
		return (NULL);

	new->n = n;
	new->next = NULL;
	new->next = NULL;

	if (*head != NULL)
	{
		last = *head;
		while (last->next != NULL)
			last = last->next;

		last->next = new;
		new->prev = last;
	}
	else
	{
		*head = new;
	}

	return (new);
}
