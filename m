Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA721B6D1A
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 12:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787316624; cv=none; b=tWpIe7JoywX0cSPQpJqh5oVJZHj9XjGJ1j+tQK17WgNTKisvQNs32BJ6tWTLEVHeJNOwViva58EuNkPDH5Tg42fA6kPHVTm7+yNcW1i+7DtLaKN0fAx+AlX9zuL4A/ihHC9WvsPhneOhyUIhXT5bXnco0BGUUsYgqDz9GU6u4wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787316624; c=relaxed/simple;
	bh=Lx1PAqD9DwlKWhANIjX4UuxImAm6Zbj2zE/zt3sY+cw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u6QGPC4jN0sfiB8DpFV6xW/MBLfiRhRw4koCYQsfs8rsS21atjVdCaXE6DYv+JVoEWoluoTKaFf6XDvBycYHgCt1Uip+VfJKYDbJyelzdwY9xSo14VqOmYBBuiXgBY+n5zLy6MekutD3lI2x/COclKv2nu36y6xZnyAMBn5rAQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxxxSQUq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxxxSQUq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACC11F000E9;
	Fri, 21 Aug 2026 12:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787316623;
	bh=WNEZGIgKowTUFRgDuI8YveezeO6u0ZYW8XLrYz8wk0c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hxxxSQUqofnmudTF/7naqoJ3xNXVCHWmTiGqwbEK9gCmy5L5vKFNHhO8JsIeurLA8
	 2vI+1PpaoMYU8W2+sokUKs8aTzJwUaT7zbT0k7WvLmS16fzMfV6viZfpYtKYlkV5Bf
	 ebiJcybEWcCYoKKKQRFoxRS+EIvT7//aDuPvHJ3qvOlsT4PXEcDgr9KWfXQQ3xUtxy
	 lWbHgy6z8/Hi1pwgz414mTkRBmKGXjhk+PVw9Db/DJaVMzCfoxPmjQEx967Bkto62y
	 X52S9kvCreqdlBiOYisfE7jvE+fFlF6hhyEAW472a9dL3DCnG0YHQx8hhHXLKT1RYD
	 ontFZtSBQFOAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] mfd: tps65217: Fix NULL pointer dereference in
 remove callback
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?0JbQsNC80LHQsNC60LjQtdCyINCg0LDQtNC40Lkg0KDQuNC60LDRgNC0?=
 =?utf-8?b?0LjQvdC+0LLQuNGH?= <r.zhambakiev@prosoftsystems.ru>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260821123712.260443-5-r.zhambakiev@prosoftsystems.ru>
References: <20260821123712.260443-1-r.zhambakiev@prosoftsystems.ru>
 <20260821123712.260443-5-r.zhambakiev@prosoftsystems.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 12:50:22 +0000
Message-Id: <20260821125022.EACC11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Medium] The patch unconditionally calls disable_irq_wake() in tps65217_r=
emove(), which will trigger a kernel warning if enable_irq_wake() failed du=
ring initialization.

Pre-existing issues:
- [High] The probe error path destroys the IRQ domain while the devres-mana=
ged parent IRQ is still active, leading to a race condition and NULL pointe=
r dereference.
- [High] The manual teardown of the IRQ domain in remove() violates devres =
ordering, leaking child device IRQ actions and threads.
- [High] The probe function dynamically mutates the shared static MFD cell =
array, permanently corrupting global state.
- [High] tps65217_irq_thread() passes an unchecked return value from irq_fi=
nd_mapping() to handle_nested_irq(), causing a potential NULL pointer deref=
erence.
--

--- Patch [4]: [PATCH v2 4/4] mfd: tps65217: Fix NULL pointer dereference i=
n remove callback ---
commit bf3143cb9e2d379d490e398c9daa01af3b2614ad
Author: =D0=96=D0=B0=D0=BC=D0=B1=D0=B0=D0=BA=D0=B8=D0=B5=D0=B2 =D0=A0=D0=B0=
=D0=B4=D0=B8=D0=B9 =D0=A0=D0=B8=D0=BA=D0=B0=D1=80=D0=B4=D0=B8=D0=BD=D0=BE=
=D0=B2=D0=B8=D1=87 <r.zhambakiev@prosoftsystems.ru>

mfd: tps65217: Fix NULL pointer dereference in remove callback

When the device is probed without an interrupt, tps65217_irq_init() is
never called and tps->irq_domain remains NULL. The remove callback
still looks up IRQ mappings and calls irq_domain_remove(), which
dereferences the NULL domain and crashes the kernel. The mapping
lookup with a NULL domain falls back to the default IRQ domain and can
dispose mappings belonging to other devices.

Quiesce the parent interrupt before tearing down the domain: the
devres-managed interrupt is only freed after the remove callback
returns, so an interrupt firing in that window would run the threaded
handler with a NULL irq_domain. Also call disable_irq_wake() to balance
the enable_irq_wake() done in tps65217_irq_init().

Fixes: 6556bdacf646fcaa ("mfd: tps65217: Add support for IRQs")
Cc: stable@vger.kernel.org
Signed-off-by: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>

> diff --git a/drivers/mfd/tps65217.c b/drivers/mfd/tps65217.c
> index d535d140c2e94..9f4afbaa65249 100644
> --- a/drivers/mfd/tps65217.c
> +++ b/drivers/mfd/tps65217.c
> @@ -403,17 +403,20 @@ static int tps65217_probe(struct i2c_client *client)
>  static void tps65217_remove(struct i2c_client *client)
>  {
>  	struct tps65217 *tps =3D i2c_get_clientdata(client);
> -	unsigned int virq;
> -	int i;
> =20
> -	for (i =3D 0; i < TPS65217_NUM_IRQ; i++) {
> -		virq =3D irq_find_mapping(tps->irq_domain, i);
> -		if (virq)
> -			irq_dispose_mapping(virq);
> -	}
> +	if (!tps->irq_domain)
> +		return;
> =20
> -	irq_domain_remove(tps->irq_domain);
> -	tps->irq_domain =3D NULL;
> +	/*
> +	 * The interrupt is only freed by devres after this callback
> +	 * returns, so make sure no handler can run while the domain
> +	 * is being torn down.
> +	 */
> +	disable_irq(tps->irq);
> +	synchronize_irq(tps->irq);
> +	disable_irq_wake(tps->irq);

[Severity: Medium]
Will this unconditional disable_irq_wake() cause a kernel warning?

If the parent IRQ controller does not support wakeups, enable_irq_wake() in
tps65217_irq_init() will fail and return an error code, leaving the wake_de=
pth
at 0. Because the driver ignores this return value, it proceeds normally.

When the driver is unloaded, tps65217_remove() unconditionally calls
disable_irq_wake(). This decrements the wake_depth below 0, causing
irq_set_irq_wake() to emit a WARN(1, 'Unbalanced IRQ %d wake disable\n', ir=
q).

> +
> +	tps65217_irq_cleanup(tps);

[Severity: High]
This is a pre-existing issue, but does calling tps65217_irq_cleanup() here =
leak
child device IRQ actions and threads by violating devres ordering?

Child devices are registered via devm_mfd_add_devices(), meaning they are
unbound by devres after tps65217_remove() returns. However, tps65217_remove=
()
manually calls tps65217_irq_cleanup(), which disposes IRQ mappings and dest=
roys
the domain.

When devres later unbinds the children, their free_irq() calls attempt to f=
ree
IRQs using freed descriptors. irq_to_desc() returns NULL, causing free_irq(=
) to
return silently without freeing the irqaction or stopping the kthread.

>  }


[Severity: High]
This is a pre-existing issue, but does the probe error path destroy the IRQ
domain while the devres-managed parent IRQ is still active?

drivers/mfd/tps65217.c:tps65217_probe() {
    ...
	ret =3D devm_mfd_add_devices(tps->dev, -1, tps65217s,
				   ARRAY_SIZE(tps65217s), NULL, 0,
				   tps->irq_domain);
	if (ret < 0) {
		dev_err(tps->dev, "mfd_add_devices failed: %d\n", ret);
		tps65217_irq_cleanup(tps);
		return ret;
	}
    ...
}

If devm_mfd_add_devices() fails, the error path explicitly calls
tps65217_irq_cleanup(), destroying tps->irq_domain. However, the parent IRQ=
 is
devres-managed and remains active until probe returns.

If the interrupt fires in this window, tps65217_irq_thread() will run with a
NULL irq_domain, passing 0 from irq_find_mapping() into handle_nested_irq(),
which dereferences NULL:

drivers/mfd/tps65217.c:tps65217_irq_thread() {
    ...
	for (i =3D 0; i < TPS65217_NUM_IRQ; i++) {
		if (status & BIT(i)) {
			handle_nested_irq(irq_find_mapping(tps->irq_domain, i));
			handled =3D true;
		}
	}
    ...
}


[Severity: High]
This is a pre-existing issue, but does passing the unchecked return value of
irq_find_mapping() to handle_nested_irq() cause a potential NULL pointer
dereference?

drivers/mfd/tps65217.c:tps65217_irq_thread() {
    ...
	for (i =3D 0; i < TPS65217_NUM_IRQ; i++) {
		if (status & BIT(i)) {
			handle_nested_irq(irq_find_mapping(tps->irq_domain, i));
			handled =3D true;
		}
	}
    ...
}

irq_find_mapping() returns 0 if it cannot find a mapping for the hardware I=
RQ.
The driver passes this return value directly to handle_nested_irq(0).

On systems where irq 0 is invalid or sparse IRQs are used, irq_to_desc(0)
returns NULL, leading to a kernel crash when handle_nested_irq() attempts to
lock the descriptor.


[Severity: High]
This is a pre-existing issue, but does dynamically modifying the shared sta=
tic
tps65217s array permanently corrupt global state?

drivers/mfd/tps65217.c:tps65217_probe() {
    ...
	if (client->irq) {
		ret =3D tps65217_irq_init(tps, client->irq);
		if (ret)
			return ret;
	} else {
		int i;

		/* Don't tell children about IRQ resources which won't fire */
		for (i =3D 0; i < ARRAY_SIZE(tps65217s); i++)
			tps65217s[i].num_resources =3D 0;
	}
    ...
}

If a tps65217 device is probed without an interrupt (client->irq =3D=3D 0),=
 the
probe function loops over the shared static tps65217s array and sets
num_resources =3D 0 for all cells.

Because this array is global, any subsequently probed devices (even those w=
ith
valid IRQs) will inherit this corrupted state and fail to register their
resources.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821123712.2604=
43-1-r.zhambakiev@prosoftsystems.ru?part=3D4
