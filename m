Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1E048033E
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 06:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791874269; cv=none; b=peX1O24WRVeSstXgdYm2zjjvzgu2TjwvmYHB1GB6TAdKNLyBOdpEm7FYf4LvwT49exacf7qPeIKtDZQpbI3mPkT+vXP3I0PbiAK6cYw/6OpD2yTzUlvShssZsIPkba9nmSo4suXSWgt0nlV7dyMNkCCyOhKfA0Pa25cHqCfAi8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791874269; c=relaxed/simple;
	bh=d8YaEZ3aHwVMiJFN+YofQ6ON/KCZg1lLIAihZvLJNw4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hzdJATVCsHX81mCbiCapg3bze6nrgHo4Mm7W60cEwCdBBE9IbhfluerLpGdimH85YmRdaU+U8uTLeAWZqlUYmaSjGYW8W+gF7Mcn9dejLwy1G9tcr5uaPDGk+nUoAlpONYkw2aBnq2PKIU1PRWqgva4Zhy3WPMby+Hzv+xpMm/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSrhIxYP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSrhIxYP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983581F000FF;
	Tue, 13 Oct 2026 06:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791874266;
	bh=S2qO3jwCg1knuCCd1wtUahqfgkgftouH5TRK3sYbL3c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WSrhIxYPQIvE6Qk+qdgzQlmhOg1kiltA07DjX9gsrYzjVeDkJ9uIStISiy7ESMsug
	 A6V2zwhvvgvHcqfpXbYRPLWdIzOHcawto72V85T++w+8yNY4zeIy6PkwxoSITmdmvr
	 5y9jhsHP4hsUdd4lBFYZGWIXyrHF06vOa0TP5H5D0QHFpv8M4Tgi02yQ2Qv0jBskmO
	 6FCPD5xA01PKWInx8QsJo+DDM8A5U4YQjmZLB+77IYYqlzyPpy183XSrCONj3aD8qm
	 zCLQHRq7urT80oNEfvAzXvasC8KFvfVdNnPw2O+IPzJRg9fm4bJZa+1G1ZZdniGOIc
	 b10IoAj/MeSOw==
Message-ID: <sashiko-outbox-169142@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 09/12] mfd: nct6694: Extract core device management
 into a separate module
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261013063259.2734757-10-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
 <20261013063259.2734757-10-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 06:51:06 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mfd: sleeping lock inside atomic irq_chip callback on PREEMPT_RT
--

commit 73d41ff61bab9765dfc8120a108448da4e70e4f3
Author: Ming Yu <a0282524688@gmail.com>

mfd: nct6694: Extract core device management into a separate module

This commit extracts the IRQ domain and IDA handling from the USB driver
into a new nct6694-core module. The USB driver now creates the IRQ domain
before submitting the interrupt URB.

> diff --git a/drivers/mfd/nct6694-core.c b/drivers/mfd/nct6694-core.c
> new file mode 100644
> index 0000000000000..4b100882ae07b
> --- /dev/null
> +++ b/drivers/mfd/nct6694-core.c
> @@ -0,0 +1,111 @@
[ ... ]
> +static void nct6694_irq_enable(struct irq_data *data)
> +{
> +	struct nct6694 *ddata =3D irq_data_get_irq_chip_data(data);
> +	irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> +
> +	guard(spinlock_irqsave)(&ddata->irq_lock);

[Severity: High]
Does taking this lock in an irq_chip callback violate lock nesting rules on
PREEMPT_RT?

Since this callback is invoked by the IRQ core (such as enable_irq()) with =
the
irq_desc->lock raw_spinlock held, it executes in atomic context. On PREEMPT=
_RT,
spinlock_t is converted to a sleeping rt_mutex, so taking a sleeping lock i=
nside
an atomic context causes a "scheduling while atomic" BUG and lockdep splat.

Should ddata->irq_lock (declared in include/linux/mfd/nct6694.h) be convert=
ed
to a raw_spinlock_t to be safe inside atomic IRQ callbacks?

> +
> +	ddata->irq_enable |=3D BIT(hwirq);
> +}
> +
> +static void nct6694_irq_disable(struct irq_data *data)
> +{
> +	struct nct6694 *ddata =3D irq_data_get_irq_chip_data(data);
> +	irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> +
> +	guard(spinlock_irqsave)(&ddata->irq_lock);

[Severity: High]
Does taking this lock in an irq_chip callback violate lock nesting rules on
PREEMPT_RT?

Since this callback is invoked by the IRQ core with the irq_desc->lock
raw_spinlock held, it executes in atomic context. On PREEMPT_RT, spinlock_t=
 is
converted to a sleeping rt_mutex, so taking a sleeping lock inside an atomic
context causes a "scheduling while atomic" BUG.

Could this be resolved by converting ddata->irq_lock to a raw_spinlock_t?

> +
> +	ddata->irq_enable &=3D ~BIT(hwirq);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013063259.2734=
757-1-a0282524688@gmail.com?part=3D9
