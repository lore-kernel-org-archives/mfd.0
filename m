Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076782;
	b=nQ1wF1EmXUFwQnc40CtI/074fOAysO7iHDFO+eljQEDo98WGkoba9aNVR2PWpjWX9k9F
	 OjWWdxtwWb1Mx+WpLCQQyztgiqOU92y7t0fVK1qfAu23HII+WbBhWDuKB7rqnorCRs43x
	 EvVvFnijtel2lt4fKQgbjAYboHEEzPhepwYBcQv1/I2bioVOg1GriaX7ppNWc2wgKHpL7
	 4UrABYAZG6lmhNPpB4GKEKyJ7MTJxxi05cZj4LzYv6gzwlYw0uqD0JHL80nJ9qmQRDBCQ
	 bV9CEOpESmjamHegyLks992rwCZ1HvQFqLcckwGUs602GupmvsqgI4LQtl5P7UtqHEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076782;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lPQmXuLRBArFJH/3HzlCcJMxi9yYoOb3hMt08elyoqY=;
	b=ZFK8XL/cJySUaPU8ahEyDZms3LozE3OxLTa29+5xmrBJobTTLGbOS7Q/BH29m7zetZ8z
	 Ez156WvPX3NFv1cZLZVnagrSlm+pOyfAGoYMz86/Gvz4VW+ibnApFS8AG3f14IoxBeCz5
	 uuvdJruQrAGaINyjoSXsVr2PZY1jq383Ag3LjECoG1a9f0nUsbQFUIgmOiqVQmzVppp4z
	 u1IEiZ3w9gRRVLxACb6+OJGkDhkj+a7pN1LYiHcJarwb8rX/A+Xmw7sk+8rw6Nnx30mEm
	 hbJHG2/74tO3g0xs9+W13C5lUNTMMHHQa1CRJRIXPYw3hWsDag3i1vBJdg1CCiH89tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nWDPGca3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC54560A2604
	for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 08:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nWDPGca3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D8A1F000C4;
	Thu, 19 Nov 2026 08:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795076781;
	bh=lPQmXuLRBArFJH/3HzlCcJMxi9yYoOb3hMt08elyoqY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nWDPGca3FSw9cp3/j4fcXG5vo3tmO5kgrORx3XKZVYGIMVkiP0vicjjN+3ha3/D9m
	 ahNkTjPhkrRFN2JLlOiIyStmCacb5fCZIF+B7d7gAWooMbPpzLgxCRsGFJYg5LG0A0
	 leNAi/DVkVczy4oHW1mlJa5Zy3okMcgNt7TNC0RRHY2oNH9riQMU5jxyHGdL8DS1vX
	 gDup+O01izaI06LgcLo+C1NCx2Q9Diyb4GbqgoK6VfKNCEDajAL4PbYPO5I5lyGnf2
	 qdodnSiedd5rTxO8ib07VqVDkNH8QLwz0SHM/lE/T+orL2ss/zTGW7dO7jtS9PYW86
	 rtOqKCxPfHFZA==
Message-ID: <sashiko-outbox-222667@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: stmpe: Disable regulators on probe failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wang Haoran" <wanghr2026@mail.zgclab.edu.cn>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <1795076100902-8-fa247961@mail.zgclab.edu.cn>
References: <1795076100902-8-fa247961@mail.zgclab.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 08:26:20 +0000
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
- [Medium] mfd: stmpe: double regulator_disable() on unbind with
  stmpe_remove()
- [Medium] mfd: stmpe: unbalanced regulator_disable() when
  regulator_enable() fails
- [Low] mfd: stmpe: misplaced comment above stmpe_disable_regulators()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] mfd: stmpe: use-after-free and virq leak in stmpe_remove()
  [1]
--

commit bf0f4e286fa2ad07c0c3a3f5f83cd68ff2fe5396
Author: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>

mfd: stmpe: Disable regulators on probe failure

This commit registers a devm action in stmpe_probe() to disable the vcc and
vio regulators when probing fails or the device is unbound.

> diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
> index 879124de912d8..f0924556d5c2f 100644
> --- a/drivers/mfd/stmpe.c
> +++ b/drivers/mfd/stmpe.c
> @@ -1363,6 +1363,16 @@ static void stmpe_of_probe(struct stmpe_platform_d=
ata *pdata,
>  }
> =20
>  /* Called from client specific probe routines */
> +static void stmpe_disable_regulators(void *data)

[Severity: Low]
This isn't a bug, but inserting stmpe_disable_regulators() here separates t=
he
"Called from client specific probe routines" comment from stmpe_probe().

> +{
> +	struct stmpe *stmpe =3D data;
> +
> +	if (!IS_ERR(stmpe->vio) && regulator_is_enabled(stmpe->vio))
> +		regulator_disable(stmpe->vio);
> +	if (!IS_ERR(stmpe->vcc) && regulator_is_enabled(stmpe->vcc))
> +		regulator_disable(stmpe->vcc);
> +}

[Severity: Medium]
Can this disable stmpe->vio and stmpe->vcc a second time on unbind?

stmpe_remove() still runs before devres release and disables both supplies:

drivers/mfd/stmpe.c:stmpe_remove() {
	...
	if (!IS_ERR(stmpe->vio) && regulator_is_enabled(stmpe->vio))
		regulator_disable(stmpe->vio);
	if (!IS_ERR(stmpe->vcc) && regulator_is_enabled(stmpe->vcc))
		regulator_disable(stmpe->vcc);
}

regulator_is_enabled() queries the underlying regulator_dev state rather th=
an
this consumer handle's enable_count.  If either rail stays on after
stmpe_remove() (for example, an always-on regulator, a shared rail, or a fi=
xed
regulator without an enable GPIO), stmpe_disable_regulators() calls
regulator_disable() again with enable_count =3D=3D 0 and triggers the unbal=
anced
disable WARN in _regulator_disable().

> =20
>  int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
>  {
>  	struct stmpe_platform_data *pdata;
> @@ -1417,6 +1427,11 @@ int stmpe_probe(struct stmpe_client_info *ci, enum=
 stmpe_partnum partnum)
>  		if (ret)
>  			dev_warn(ci->dev, "failed to enable VIO supply\n");
>  	}
> +
> +	ret =3D devm_add_action_or_reset(ci->dev, stmpe_disable_regulators, stm=
pe);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Can stmpe_disable_regulators() also call regulator_disable() on a supply wh=
ose
regulator_enable() failed?

When regulator_enable() fails for stmpe->vcc or stmpe->vio in stmpe_probe(),
it only logs dev_warn() and leaves a valid regulator pointer with
enable_count =3D=3D 0.  If regulator_is_enabled() returns non-zero during e=
rror
unwind or unbind (for example, when another consumer keeps the rail enabled=
 or
ops->is_enabled() returns a negative error code), stmpe_disable_regulators()
calls regulator_disable() on the unenabled handle and triggers a WARN in
_regulator_disable().

[Severity: Critical]
This problem wasn't introduced by this patch, but stmpe_remove() [1]
removes stmpe->domain and disables the regulators while stmpe->irq is still
active, and leaks the child virtual IRQs mapped on stmpe->domain.

stmpe_probe() requests stmpe->irq via devm_request_threaded_irq(), so
stmpe_irq() remains enabled until devres release runs after stmpe_remove()
returns:

CPU0                              CPU1
stmpe_remove()
  mfd_remove_devices(stmpe->dev)
  irq_domain_remove(stmpe->domain)
                                  stmpe_irq()
                                    irq_find_mapping(stmpe->domain, ...)
                                      <-- use-after-free

In addition, mfd_add_device() creates virtual IRQ mappings on stmpe->domain=
 via
irq_create_mapping(), but neither mfd_remove_devices() nor stmpe_remove()
calls irq_dispose_mapping() before irq_domain_remove().  That leaks the
allocated irq_desc entries in sparse_irqs with dangling irq_data->domain and
irq_data->chip_data pointers to the freed irq_domain and struct stmpe.

[1] https://sashiko.dev/#/bug/linux-aaf90163-a755-407e-aec5-73a7ef05da1e

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/1795076100902-8-fa2=
47961@mail.zgclab.edu.cn?part=3D1
