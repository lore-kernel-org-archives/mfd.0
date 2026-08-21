Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A90306779
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 12:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787316650; cv=none; b=DdfqR8jnQiCSLWYRLFntbPux0ZnMzZr+X1zMYDUMngs2Ep2YbT+J8Dl7CwhWK+TPJE/Yau3z6I9WjqW9rWXMpuWAh9FNnI8+6Y5j1Qow09d4M041AgLqSpIBu0Yv+wvSAuDox0/GcJJf90Sr4yumKk2wNEu9XvaHKqfVMhaHHzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787316650; c=relaxed/simple;
	bh=Am7eyidFfbistyfwyAyY8bBhk2XrRUx87lPjC8+x0Fw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MzrRqyfcnnOsMXW8zfeaXbDKicaYqr9EgVs0bPwL7zXAOyMryKOo7PnxXqe/ghDGiR0dmPsYODf8dcAlBhUIdsJ6kD6NfWZ0d/0v5V2mvn57FI88mRgPv6AyGVasSHEvSmkT8lKUlUqjsz/Hniv0ebLA25gg0HYAH8r7Q0vAxh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6J1rQVR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6J1rQVR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5551A1F00A3D;
	Fri, 21 Aug 2026 12:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787316649;
	bh=B3l58kHwheLlqfjEdoNz2UB10AHYfaojb6aTDUEgxlM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U6J1rQVR1+GZm4QMtlSzfHBDH9+Jf9B5CfVLdHu6lHKBU2zIi9lHGg7hUfR3rHvmk
	 SBgEGJc22BqmlAAxWR8JY/azYt+v/j8mBKfY3505gAwRW7d3TXSveIUdZzVgNgRozW
	 QJoxqTtbt6PFysZYehcnH01gwoPdstnMULZ841Hz1o8TJAvqeZNV0+9dKK+pfIwiO0
	 UHFKn8kXSeDX0mueoXLwBI/uDMi63yZI4n/fmh9Qyxgj7oaTAlebr44hdiMiZlix24
	 p9mCNx0V37Y7WATUwPuzX0Hk6fR2c6VDsvxSo23xVhFiFNW4WCLwPfEn08b19hmI9T
	 pxMzbmy5T5zrg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] mfd: tps65217: Fix irq_domain leak and
 use-after-free on probe failure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?0JbQsNC80LHQsNC60LjQtdCyINCg0LDQtNC40Lkg0KDQuNC60LDRgNC0?=
 =?utf-8?b?0LjQvdC+0LLQuNGH?= <r.zhambakiev@prosoftsystems.ru>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260821123712.260443-4-r.zhambakiev@prosoftsystems.ru>
References: <20260821123712.260443-1-r.zhambakiev@prosoftsystems.ru>
 <20260821123712.260443-4-r.zhambakiev@prosoftsystems.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 12:50:48 +0000
Message-Id: <20260821125049.5551A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Race condition and Use-After-Free in the probe error path due to m=
anual IRQ domain destruction while the parent IRQ is still active.

Pre-existing issues:
- [High] Dynamic modification of a shared global static MFD cell array viol=
ates MFD subsystem rules and permanently breaks multi-device bindings.
- [High] Missing validation of `irq_find_mapping()` return value in the int=
errupt handler causes a kernel oops on unmapped interrupts.
--

--- Patch [3]: [PATCH v2 3/4] mfd: tps65217: Fix irq_domain leak and use-af=
ter-free on probe failure ---
commit 1b4bb1d20ba45fa2a7614a8ca5d0feae60617511
Author: =D0=96=D0=B0=D0=BC=D0=B1=D0=B0=D0=BA=D0=B8=D0=B5=D0=B2 =D0=A0=D0=B0=
=D0=B4=D0=B8=D0=B9 =D0=A0=D0=B8=D0=BA=D0=B0=D1=80=D0=B4=D0=B8=D0=BD=D0=BE=
=D0=B2=D0=B8=D1=87 <r.zhambakiev@prosoftsystems.ru>
Date:   Fri Aug 21 12:37:23 2026 +0000

    mfd: tps65217: Fix irq_domain leak and use-after-free on probe failure
   =20
    This commit moves the chip revision read ahead of IRQ initialization and
    adds a cleanup helper to dispose of IRQ mappings and remove the irq_dom=
ain
    if probe fails. It calls this cleanup helper from the devm_request_thre=
aded_irq
    and devm_mfd_add_devices error paths.

    Cc: stable@vger.kernel.org

> diff --git a/drivers/mfd/tps65217.c b/drivers/mfd/tps65217.c
> index 9a1528456ffc2..d535d140c2e94 100644
> --- a/drivers/mfd/tps65217.c
> +++ b/drivers/mfd/tps65217.c
> @@ -146,6 +146,24 @@ static const struct irq_domain_ops tps65217_irq_doma=
in_ops =3D {
>  	.map =3D tps65217_irq_map,
>  };
> =20
> +static void tps65217_irq_cleanup(struct tps65217 *tps)
> +{
> +	unsigned int virq;
> +	int i;
> +
> +	if (!tps->irq_domain)
> +		return;
> +
> +	for (i =3D 0; i < TPS65217_NUM_IRQ; i++) {
> +		virq =3D irq_find_mapping(tps->irq_domain, i);

[Severity: High]
This is a pre-existing issue, but irq_find_mapping() can return 0 if a mapp=
ing
does not exist.

If a spurious interrupt fires or an interrupt fires during teardown after
mappings are disposed:

drivers/mfd/tps65217.c:tps65217_irq_thread() {
    ...
    handle_nested_irq(irq_find_mapping(tps->irq_domain, i));
    ...
}

Could this pass 0 to handle_nested_irq() and cause a kernel oops when
irq_to_desc(0) returns NULL?

Should the return value of irq_find_mapping() be checked in
tps65217_irq_thread() before passing it to handle_nested_irq()?

> +		if (virq)
> +			irq_dispose_mapping(virq);
> +	}
> +
> +	irq_domain_remove(tps->irq_domain);
> +	tps->irq_domain =3D NULL;
> +}

[ ... ]

> @@ -337,6 +356,13 @@ static int tps65217_probe(struct i2c_client *client)
>  		return ret;
>  	}
> =20
> +	ret =3D tps65217_reg_read(tps, TPS65217_REG_CHIPID, &version);
> +	if (ret < 0) {
> +		dev_err(tps->dev, "Failed to read revision register: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
>  	if (client->irq) {
>  		ret =3D tps65217_irq_init(tps, client->irq);
>  		if (ret)

[Severity: High]
This is a pre-existing issue, but this code block mutates the shared global
tps65217s array just below the lines modified in this diff:

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

Since tps65217s is shared module data, will any subsequent probe of a
TPS65217 device inherit this mutated state and fail to register its IRQ
resources, even if an IRQ is provided?

MFD guidelines require cell arrays to be static const. Should this state
be handled dynamically instead of mutating the static array?

> @@ -354,13 +380,7 @@ static int tps65217_probe(struct i2c_client *client)
>  				   tps->irq_domain);
>  	if (ret < 0) {
>  		dev_err(tps->dev, "mfd_add_devices failed: %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret =3D tps65217_reg_read(tps, TPS65217_REG_CHIPID, &version);
> -	if (ret < 0) {
> -		dev_err(tps->dev, "Failed to read revision register: %d\n",
> -			ret);
> +		tps65217_irq_cleanup(tps);

[Severity: High]
If devm_mfd_add_devices() fails, tps65217_irq_cleanup() manually destroys
tps->irq_domain and sets it to NULL.

Since the parent IRQ was registered via devm_request_threaded_irq() earlier
in probe, it remains active until devres frees it after tps65217_probe()
returns.

If an interrupt fires in this window, could tps65217_irq_thread() locklessly
read the NULL domain, pass it to irq_find_mapping(), and potentially lead
to a kernel oops?

Should the IRQ be explicitly disabled (e.g., via disable_irq()) before
cleaning up the domain?

>  		return ret;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821123712.2604=
43-1-r.zhambakiev@prosoftsystems.ru?part=3D3
