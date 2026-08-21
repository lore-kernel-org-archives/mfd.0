Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609F2396D0D
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 08:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299387; cv=none; b=tO8cQ9Y/0yErZwfXkaIkuWOsKX7heo70dNlstafzKsL53cRoML2+YomXlAUTQnizqAxyIGXjKJNEOJhYjtTWgMTuKOmzeWZmm01l7KNuxtrFnzoMxEdz1huVNDOaEoLlMfo5rexYfPSqhYav0DKl08T5EnPAr+2DdiZRmPeMYAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299387; c=relaxed/simple;
	bh=Yl9jb3XIF7VtcbomzhoK5lRqQk2p+vypjQ9ixq5PwSs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sBOM6OdCNXySSm2HHwUEHvMoiMIj+OcN6Ua2v965BfrsnpdLj1eNF6ZWTZc9Eo+z7S58Xzr+FYsXU2FDJShEQ7pOmggvCbH7OIJKg7xUHJLdFmaRjWKy07R2hZwWGqBTFYfu4F8iYtA/3PAEZZHdFe/4LQCj0BhH3BBDpwAKK9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NvJby33K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NvJby33K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C794E1F000E9;
	Fri, 21 Aug 2026 08:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787299386;
	bh=IsseLLHCUy7nDy0n+7oWr0vgdrJwlRAOERvF9NtIeuQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NvJby33Knnyes04FNvvPrngUFNVZgLUlOLNoKaswjZJXFJjRA1/R/je2mIFjcVzdz
	 ykBSTGUTdqQFoKBPmZuGBirS5ZQpz1jh8dOVZIklgooYOIWaDpgCsCkAfFUnv/NiS3
	 Jqm1ZIGWJmq2k0rpZpBJf+0Jy9sUMEZviGMrQKylv5XQuOLaKWesK1dvLBVp0E7QNT
	 sKiFNc1EpIOO7GCAMKtfhSwzJXYJE+usXtMEV8yvTb+D9f7YlttABNyxk0BXMlCw0A
	 wtFpBM5/UlXtqtVOLPo1y/PPEYcdCQdvmdKVq9gQuxP/em5jszf9go8c+fkYgGOwyt
	 jHumUnASUIHjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] mfd: tps65217: Fix NULL pointer dereference on IRQ
 init failure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?0JbQsNC80LHQsNC60LjQtdCyINCg0LDQtNC40Lkg0KDQuNC60LDRgNC0?=
 =?utf-8?b?0LjQvdC+0LLQuNGH?= <r.zhambakiev@prosoftsystems.ru>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260821075331.131315-2-r.zhambakiev@prosoftsystems.ru>
References: <20260821075331.131315-1-r.zhambakiev@prosoftsystems.ru>
 <20260821075331.131315-2-r.zhambakiev@prosoftsystems.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 08:03:05 +0000
Message-Id: <20260821080305.C794E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] The patch introduces a memory leak and Use-After-Free of the `tps`=
 structure on the probe error path.

Pre-existing issues:
- [High] The patch fails to resolve the NULL pointer dereference and mappin=
g disposal oops for devices configured without an IRQ.
- [High] Devres teardown ordering race causes the IRQ handler to execute wi=
th a destroyed IRQ domain.
- [High] Dynamic mutation of the global static `mfd_cell` array corrupts st=
ate for multi-instance support and violates MFD guidelines.
- [High] Multi-register password unlock sequences and read-modify-write ope=
rations lack driver-level locking.
--

--- Patch [1]: [PATCH 1/2] mfd: tps65217: Fix NULL pointer dereference on I=
RQ init failure ---
commit dc1e26d9bf54b1760aeb21201e00e49a112f4f13
Author: =D0=96=D0=B0=D0=BC=D0=B1=D0=B0=D0=BA=D0=B8=D0=B5=D0=B2 =D0=A0=D0=B0=
=D0=B4=D0=B8=D0=B9 =D0=A0=D0=B8=D0=BA=D0=B0=D1=80=D0=B4=D0=B8=D0=BD=D0=BE=
=D0=B2=D0=B8=D1=87 <r.zhambakiev@prosoftsystems.ru>

mfd: tps65217: Fix NULL pointer dereference on IRQ init failure

This commit adds a check for the return value of tps65217_irq_init() in
tps65217_probe() to abort the probe if IRQ initialization fails. This is
intended to prevent a NULL pointer dereference in tps65217_remove() when
the irq_domain creation fails.

> diff --git a/drivers/mfd/tps65217.c b/drivers/mfd/tps65217.c
> index c240fac0ede76..2d04d9e0ae29c 100644
> --- a/drivers/mfd/tps65217.c
> +++ b/drivers/mfd/tps65217.c
> @@ -333,7 +333,9 @@ static int tps65217_probe(struct i2c_client *client)
>  	}
> =20
>  	if (client->irq) {

[Severity: High]
This is a pre-existing issue, but does this still leave a NULL pointer
dereference and mapping disposal oops if the device is configured without
an IRQ?

If client->irq is 0, tps65217_irq_init() is never called, and tps->irq_doma=
in
remains NULL. When the driver is unbound, tps65217_remove() unconditionally
uses tps->irq_domain:

drivers/mfd/tps65217.c:tps65217_remove() {
    ...
    for (i =3D 0; i < TPS65217_NUM_IRQ; i++) {
        virq =3D irq_find_mapping(tps->irq_domain, i);
        if (virq)
            irq_dispose_mapping(virq);
    }

    irq_domain_remove(tps->irq_domain);
    ...
}

Calling irq_find_mapping() with a NULL domain falls back to the default IRQ
domain, which can inappropriately dispose of unrelated mappings. Subsequent=
ly,
irq_domain_remove() will oops on the NULL pointer.

[Severity: High]
This is another pre-existing issue related to the IRQ teardown, but is there
a devres ordering race here that could cause the IRQ handler to execute with
a destroyed IRQ domain?

In tps65217_remove(), the IRQ domain is destroyed prematurely before the
threaded IRQ is freed by devres:

drivers/mfd/tps65217.c:tps65217_remove() {
    ...
    irq_domain_remove(tps->irq_domain);
    tps->irq_domain =3D NULL;
}

Since the interrupt was requested using devm_request_threaded_irq() in
tps65217_irq_init(), its teardown is deferred until devres cleanup runs
after tps65217_remove() returns. If an interrupt fires during this window,
tps65217_irq_thread() runs and calls irq_find_mapping() with a NULL domain,
potentially invoking an unrelated handler or crashing.

> -		tps65217_irq_init(tps, client->irq);
> +		ret =3D tps65217_irq_init(tps, client->irq);
> +		if (ret)
> +			return ret;

[Severity: High]
Could this new early return introduce a memory leak of the IRQ domain and a
use-after-free of the devres-managed tps structure?

If devm_request_threaded_irq() fails in tps65217_irq_init(), it returns an
error, which is now propagated here. However, the unmanaged IRQ domain
allocated earlier in tps65217_irq_init() via irq_domain_create_linear() is
not freed, causing a leak.

Because probe fails, devres automatically frees the tps structure. The leak=
ed
IRQ domain retains a dangling pointer to this freed structure in
domain->host_data. Any subsequent domain lookups will trigger a
use-after-free.

>  	} else {
>  		int i;

[Severity: High]
This is a pre-existing issue, but does mutating the global static tps65217s
mfd_cell array corrupt state for multi-instance support and violate MFD
guidelines?

A few lines down, if client->irq is 0, tps65217_probe() zeroes out
num_resources for all cells in the globally shared static tps65217s array:

drivers/mfd/tps65217.c:tps65217_probe() {
    ...
    } else {
        int i;

        /* Don't tell children about IRQ resources which won't fire */
        for (i =3D 0; i < ARRAY_SIZE(tps65217s); i++)
            tps65217s[i].num_resources =3D 0;
    ...
}

If multiple instances of the TPS65217 are probed, an instance without an IRQ
will permanently wipe out the IRQ resources for any subsequent instances th=
at
do have an IRQ. Concurrent probes would also result in a data race.

MFD subsystem guidelines strictly mandate that mfd_cell arrays must be
static const and not dynamically modified.

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but do the multi-register passwo=
rd
unlock sequences and read-modify-write operations lack driver-level locking?

Looking at tps65217_reg_write(), it executes a multi-step password unlocking
sequence:

drivers/mfd/tps65217.c:tps65217_reg_write() {
    ...
    xor_reg_val =3D reg ^ TPS65217_PASSWORD_REGS_UNLOCK;
    ret =3D regmap_write(tps->regmap, TPS65217_REG_PASSWORD, xor_reg_val);
    if (ret < 0)
        return ret;

    return regmap_write(tps->regmap, reg, val);
}

While regmap protects individual writes, concurrent calls from MFD child
drivers to tps65217_reg_write() or tps65217_update_bits() will interleave.

For example, Thread A's password write could be immediately followed by Thr=
ead
B's password write, causing the subsequent target writes to fail or corrupt
other registers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821075331.1313=
15-1-r.zhambakiev@prosoftsystems.ru?part=3D1
