Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B103D812A
	for <mfd@lists.linux.dev>; Wed,  7 Oct 2026 09:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365625; cv=none; b=NNe5s64zFlmiO5XLG71fcPYdtLUYNbnUiuyL2cbnn8+KvAZEF9zZVDiwoe/G8F5wAd0f99plKrxNcRTOF+pUHctCkSy7HMbPbia3JOhExMnB55Z067cpKO/vDtGsTljl/asIwFvhj4KOLMev/YWnUeRFll0yBYIiv0du3PbppxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365625; c=relaxed/simple;
	bh=lRolEP5Bu66+F24aNmurOmTrRkAr4SUXWCBShvFRh1M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=N4DRRAXSyTtp/daInoi++Pu00n7drJ3OYuOdQTXJc4mSnMSexEZpgpRN/lSNur1MsSgfGcaMtmHeyX9uRqdVVPA75ltz/mj5Da8W2F7e9Jq2vYko61G6N53CuR3wOTbbK6xTUqkFAoeEJdE0Q3SbP2mphudG97YoE119q4A5qG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozp5Uzfd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozp5Uzfd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC6B1F0089B;
	Wed,  7 Oct 2026 09:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791365611;
	bh=13rjB+nsPfgljE3kVi7YbwRIFOSFULhdGcJN1h5Ij/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ozp5Uzfd7WKETGSRLQQFq6IPgu3Bq+e6gSHi4mMk5CgrNBtGHwEuUQZ0umwpCz/Pj
	 bc+p4BcIavYS6xgY6/bjwjsAKSJ9tVZSWWpxZYzUaLrzvxW/sBFANQ9xCYd9vgbJfz
	 0aKuTyZol84fkSFPHRBstgmYe2UM4pMJMnFGgyN2/Dq3NxJhqc0TsL1/5MP+peHAcI
	 VUjl20/4zWfsRXujqMtsfNYhQvxmUC4dDavkatWA7ur9qMVbOoBXIAW3evkBchpeNa
	 5yP20RN+9aWRbM3zx3WuSKinwkGdNDbt72rbVYgJePct7kuM6M2x6r7RfKCxCftIHS
	 y1+jzxFpjfRdw==
Message-ID: <sashiko-outbox-162798@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 12/13] mfd: nct6694: Add a Kconfig symbol for the USB
 transport
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261007092102.3768818-13-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
 <20261007092102.3768818-13-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 09:33:31 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mfd: nct6694_irq_enable() tracks state but fails to mask hardwar=
e interrupts
--

commit bcc3da085a9a041b0467d9dc36ab1c8f97cd9de2
Author: Ming Yu <a0282524688@gmail.com>

mfd: nct6694: Add a Kconfig symbol for the USB transport

Now that the sub-device drivers only access the device through regmap,
the core no longer depends on USB. The USB transport is built under a new
MFD_NCT6694_USB symbol.

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
> +
> +	ddata->irq_enable |=3D BIT(hwirq);
> +}

[Severity: Medium]
Does this code successfully mask hardware interrupts?

It looks like ddata->irq_enable is updated here to track the state, but is
never actually evaluated when processing incoming interrupts.

[ ... ]
> diff --git a/drivers/mfd/nct6694-usb.c b/drivers/mfd/nct6694-usb.c
> new file mode 100644
> index 0000000000000..636721f277a04
> --- /dev/null
> +++ b/drivers/mfd/nct6694-usb.c
> @@ -0,0 +1,414 @@
[ ... ]
> +static void nct6694_usb_int_callback(struct urb *urb)
> +{
> +	struct nct6694 *ddata =3D urb->context;
> +	__le32 *status_le =3D urb->transfer_buffer;
> +	u32 int_status;
> +	int ret;
> +
> +	switch (urb->status) {
> +	case 0:
> +		break;
> +	case -ECONNRESET:
> +	case -ENOENT:
> +	case -ESHUTDOWN:
> +		return;
> +	default:
> +		goto resubmit;
> +	}
> +
> +	if (urb->actual_length < sizeof(*status_le))
> +		goto resubmit;
> +
> +	int_status =3D le32_to_cpu(*status_le);
> +
> +	while (int_status) {
> +		int irq =3D __ffs(int_status);
> +
> +		generic_handle_domain_irq_safe(ddata->domain, irq);
> +		int_status &=3D ~BIT(irq);
> +	}

[Severity: Medium]
Since ddata->irq_enable isn't consulted here, won't this result in
continuously firing disabled hardware interrupts to the kernel?

Should int_status be filtered against ddata->irq_enable before calling
generic_handle_domain_irq_safe()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007092102.3768=
818-1-a0282524688@gmail.com?part=3D12
