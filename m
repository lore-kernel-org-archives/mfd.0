Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083125;
	b=kcLo4ct98AO78TCF+a6250bRcQOK0rIJMjKo5kWaXwj0xufWnhj3yBpmdlWXJMTZfGo4
	 PrP62aAPu6afpP8o1JAgbvV6tvPWJRD895obZwrSOzMdwCQImUv2SP5fUWZ6fUu387rWL
	 wIx9ZxOAR920Ama/5wBW99+rk9OlZX6GNHLtkY+pORkzrqwmCN4M1LaNk4OmP7XligQOE
	 F7d7OxxBmw+eCf0LWrb5OKN5NCdJ/iCZRT4NE92fWliYBdKj0InBCn6PrSEWrNnJTWaUh
	 c+MEW+9vIGleF3JjjLdyOF3SHcJ0NO4NRSxnorHlodTceqijmfjH0bm00HW1VWJ+4Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083125;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=b57EhIeMh3GyP+Ty5MoLZAGMe7ksDipfqF6EJAD6Pto=;
	b=JyxNtKE2MTKR3nn5v2M1FOSTRPdCMUPEwbsMBV/ywE72z5aefU0PiDaRBNnFOyKAmLWI
	 ljtM85mk1X6Nu2GtcQFqLja1hmGG1t7+/muq6eSWc15jp2lm4bUw4UJe8hxv2LDoOBWXQ
	 bPmRpijPBjuH43CKXCjN5SamhfGXacQybk9W9myZnCkGqstgPn9SLwToKOLK1uT6ulQnX
	 1svMHDJEW8UBznfZu+6so9yjCaqFJBLhvWXrA81gJFaAQ/FOEXTeX72Lh5CVztRBZpwRe
	 CnBX9xbao1y2X6b6SNp6Z5+qaQ86tOE1mxc+DNCeHMrnPR4DNl/+dC7k+iwAnFCU0OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="B9Kx6mj/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F180D606A330
	for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 10:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B9Kx6mj/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B231F000C4;
	Thu, 19 Nov 2026 10:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083124;
	bh=b57EhIeMh3GyP+Ty5MoLZAGMe7ksDipfqF6EJAD6Pto=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B9Kx6mj/Ty4FtSrBMOMC1JqGX36GbANGKS4i+dTNdxRkMhbU7WeYQxyMd0DdrCOAC
	 ibIImBeegoowlHEeepCchflXWe+zoRHuM/pAy6ZpguvxRb1mKFRAmAkfRTgDobxMCh
	 31OGNgnXo0T9qOiSQyzh/2+mv6WEBwjSy1uxCx2/IEaKt7x0P72QFMvRLLMbbygWdo
	 jzI7nKn2t/NMnjRdZuFxIONjOHJRnDKiKi3FRNzs0CqRPcftK2/W3Fba/bPO2CKkSN
	 imUvost+UN4fnTTW6BFRwXzDYEJWheZqK21xbiUU2Lk7f1KickDlgo2IUbi6ga+7p/
	 v7+9MxmkWrZ8w==
Message-ID: <sashiko-outbox-222922@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 1/5] i3c: hub: Mark downstream DT addresses as
 desired on parent bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>, linux-i3c@lists.infradead.org, mfd@lists.linux.dev
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, lee@kernel.org
In-Reply-To: <20261119095449.555593-2-lakshay.piplani@nxp.com>
References: <20261119095449.555593-1-lakshay.piplani@nxp.com>
 <20261119095449.555593-2-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 10:12:03 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] i3c: hub: attached downstream devices leave parent slot free
- [Medium] i3c: hub: downstream ENTDAA devices miss boardinfo for
  SETNEWDA
- [Low] i3c: hub: missing Fixes trailer for commit b0cfe49a2e3b
--

commit 8029b535e0098c5324d297a089353d72c193eebe
Author: Lakshay Piplani <lakshay.piplani@nxp.com>

> i3c: hub: Mark downstream DT addresses as desired on parent bus
>
> I3C devices behind hub target ports share the parent controller's
> dynamic address space. Their assigned dynamic addresses from Device
> Tree must be preserved so that parent DAA does not allocate the same
> addresses to other devices.
>
> Previously, the hub reserved these addresses by marking the parent
> bus slots as I3C_ADDR_SLOT_I3C_DEV, even though the downstream devices
> were not attached to the parent bus. This could cause address
> reconciliation to incorrectly treat these slots as occupied by
> orphaned I3C devices.
>
> Introduce i3c_bus_set_addr_slot_desired() to mark an address as
> desired without changing its current slot status.
>
> Use this helper when processing downstream I3C devices described in
> Device Tree. This allows parent DAA to avoid the desired addresses
> while keeping the slots free until the corresponding devices are
> actually attached.
>
> Keep the desired address markings for the lifetime of the parent bus,
> as they represent the fixed Device Tree topology.
>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>

[Severity: Low]
This fixes the parent-bus slot reservation in
i3c_hub_reserve_parent_addrslots_from_dt().  Should this include:

  Fixes: b0cfe49a2e3b ("i3c: hub: Add support for the I3C interface in the =
I3C hub")

> diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
> index 5390287680844..95eec5b0cada0 100644
> --- a/drivers/i3c/hub.c
> +++ b/drivers/i3c/hub.c
> @@ -763,10 +763,15 @@ EXPORT_SYMBOL_GPL(i3c_hub_init);
>   * @hubc: I3C hub controller for a target-port virtual bus.
>   * @node: Target-port bus Device Tree node.
>   *
> - * Reserve parent bus address slots for the assigned dynamic address of =
each
> - * downstream I3C device described in the Device Tree, so that parent DA=
A does
> - * not hand the same address to another device. Downstream devices behin=
d hub
> - * target ports share the parent controller's dynamic address space.
> + * Mark the assigned dynamic address of each downstream I3C device descr=
ibed in
> + * the Device Tree as desired on the parent bus, so that parent DAA avoi=
ds
> + * handing the same address to another device while it is still free.
> + * Downstream devices behind hub target ports share the parent controlle=
r's
> + * dynamic address space.
> + *
> + * A desired address is only a preference: the slot stays free, so the p=
arent
> + * does not report it as occupied and address reconciliation does not mi=
stake
> + * it for an orphaned device that has to be probed.
>   *
>   * The reservations describe a fixed Device Tree topology and are kept f=
or the
>   * lifetime of the parent bus; they are not released when a target port =
is
> @@ -816,9 +821,8 @@ int i3c_hub_reserve_parent_addrslots_from_dt(struct i=
3c_hub_controller *hubc,
>  		status =3D i3c_bus_get_addr_slot_status(&parent->bus,
>  						      assigned_addr);
>  		if (status =3D=3D I3C_ADDR_SLOT_FREE)
> -			i3c_bus_set_addr_slot_status(&parent->bus,
> -						     assigned_addr,
> -						     I3C_ADDR_SLOT_I3C_DEV);
> +			i3c_bus_set_addr_slot_desired(&parent->bus,
> +						      assigned_addr);
>  		i3c_bus_maintenance_unlock(&parent->bus);
>  	}
>  	return 0;

[Severity: Medium]
Does assigned_addr ever get marked as I3C_ADDR_SLOT_I3C_DEV on parent->bus
when a downstream device is attached via SETDASA or SETAASA?

i3c_bus_set_addr_slot_desired() only sets I3C_ADDR_SLOT_EXT_DESIRED and
leaves the slot status bits on parent->bus as I3C_ADDR_SLOT_FREE.  When
the virtual hub controller initializes a downstream device that has a
static address and assigned-address, i3c_master_attach_i3c_dev() and
i3c_master_reattach_i3c_dev_locked() only update the virtual bus
(hubc->controller.bus), while i3c_hub_attach_i3c_dev() and
i3c_hub_reattach_i3c_dev() call the controller-only helpers on parent
without updating parent->bus.addrslots.

Because the device already received its dynamic address, it does not
participate in ENTDAA during i3c_hub_do_daa().  Its slot status on
parent->bus remains I3C_ADDR_SLOT_FREE even while the device is actively
using assigned_addr on the shared physical bus, allowing the fallback loop
in i3c_bus_get_free_addr(&parent->bus, ...) or other
i3c_bus_get_addr_slot_status(&parent->bus, ...) checks to hand the in-use
address to another device.

[Severity: Medium]
Can a downstream device with assigned-address that is discovered through
ENTDAA ever receive its desired address?

Marking assigned_addr with I3C_ADDR_SLOT_EXT_DESIRED causes
i3c_bus_get_free_addr(&parent->bus, ...) to skip assigned_addr during
ENTDAA and hand out a temporary dynamic address, relying on
__i3c_master_add_i3c_dev_locked() to look up
newdev->boardinfo->init_dyn_addr and switch the device to its desired
address via SETNEWDA.

However, i3c_hub_do_daa() calls i3c_master_do_daa(parent), so
__i3c_master_add_i3c_dev_locked() runs with master set to parent and
i3c_master_attach_boardinfo() only searches parent->boardinfo.i3c:

drivers/i3c/master.c:i3c_master_attach_boardinfo() {
	struct i3c_master_controller *master =3D i3cdev->common.master;
	struct i3c_dev_boardinfo *i3cboardinfo;

	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
	...
}

Because fwnode_populate_i3c_bus() populated the downstream boardinfo entries
on hubc->controller.boardinfo.i3c rather than parent->boardinfo.i3c,
newdev->boardinfo is never found, SETNEWDA is not issued, and the device is
left at the temporary address without its DT boardinfo attached.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119095449.5555=
93-1-lakshay.piplani@nxp.com?part=3D1
