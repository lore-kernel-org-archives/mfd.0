Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB92C3E0C77
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 07:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791874941; cv=none; b=ZMUfe34dNyJaoYUguUEJGoOk6t6aBb7oZdX7NwVS0zoOcIl0MmRe5PrmCewXdGD2JfMeI3chPlxtHDiBPu7rmA35qD0D5/IGGbvGYRgfvJjjp/3z03aGh/FJRejSZ1ieUtZfTXP/pU7StnhxExqTr891ua6xRPLMe8iK1rXRB/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791874941; c=relaxed/simple;
	bh=WlMjFmFK13uJeWsoDKd9D6ZjfLS2ddkK861miJGPi5o=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LqzXLY2aWJF3Tr+O7DiqXSKMRAPXg+674mnL3c96QZQdlp5/JzPPDxsjPXPxPhzQNa1HvJLFUrcQlcxp0oy6td0fZzkUtcDyGpBTDHFnjPqRJBnpIdAoZg+Rv7y3ZkBOWUvGoS9OyRDKp/3JpVO2JUYPp5FICQ+Dp5KjyMVbNAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WH7yD/bZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WH7yD/bZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3941F000FF;
	Tue, 13 Oct 2026 07:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791874940;
	bh=FRKbf7XwdD9caCUX9VXNXlX3/TglR2IQcCAYn3zyehI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WH7yD/bZLcIqWnyfsjasyPexBT5iLUnfxdQ5ZX8TYsUJ7diYVqY0f+SLyCLbr3Sql
	 EPcKxMdIGxmziP8xAH7NV6Y0RJDxXJ9FZZpAOUYlPBDdno1OZHR9N+qjdw5awhp/G3
	 z7CbkFLieV1u597NZWuymIYLHr+bfPZFj+xrH8fHNuXWzNyc9Nm4FLUixAQ+4/L0WS
	 CCMvj5Zwhnxv+H0G0N/k2Wgpo3FdI+BFTgePHmKw42/lzrqjxP9+9ElmW2MjmIKDRa
	 P7Ds3attgHfg8PYWiK+qfdLMKCc/9rZ9vne2vYtAalO2sIde6p9HVs9KtPnje//XaH
	 kCkjGI2TG6ebA==
Message-ID: <sashiko-outbox-169155@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 12/12] mfd: nct6694: Add Host Interface (HIF) eSPI
 transport driver
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261013063259.2734757-13-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
 <20261013063259.2734757-13-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 07:02:20 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mfd: nct6694: uninitialized kernel memory leak in regmap_read
--

commit dd833ce9ad43ea52da90e8d6b619b3c19f22934e
Author: Ming Yu <a0282524688@gmail.com>

mfd: nct6694: Add Host Interface (HIF) eSPI transport driver

This commit adds support for the Host Interface transport over eSPI for the
Nuvoton NCT6694. It locates the Super-I/O to configure the shared memory
base address and SIRQ, and implements a regmap bus that exchanges firmware
commands through the shared memory window.

> diff --git a/drivers/mfd/nct6694-hif.c b/drivers/mfd/nct6694-hif.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/mfd/nct6694-hif.c

[ ... ]

> +static int nct6694_hif_xfer_msg(struct nct6694 *ddata,
> +				const struct nct6694_cmd_header *cmd_hd,
> +				u8 hctrl, const void *tx_buf, void *rx_buf)
> +{

[ ... ]

> +	if (tx_buf)
> +		memcpy_toio(data, tx_buf, data_len);
> +

[ ... ]

> +static int nct6694_hif_regmap_read(void *context, const void *reg_buf,
> +				   size_t reg_size, void *val_buf,
> +				   size_t val_size)
> +{
> +	struct nct6694 *ddata =3D context;
> +	struct nct6694_hif_data *hif_data =3D to_nct6694_hif_data(ddata);
> +	u32 reg =3D get_unaligned_be32(reg_buf);
> +	u8 hctrl =3D FIELD_GET(NCT6694_REG_HCTRL, reg);

[ ... ]

> +	return nct6694_hif_xfer_msg(ddata, &cmd_hd, hctrl,
> +				    hctrl =3D=3D NCT6694_HCTRL_SET ? val_buf : NULL,
> +				    val_buf);
> +}

[Severity: High]
Does this code inadvertently copy uninitialized kernel memory to the device?

Looking at nct6694_hif_regmap_read(), val_buf is an output buffer provided =
by
the regmap core and contains uninitialized memory.

If a caller (such as debugfs) requests a read from a register offset where
the NCT6694_HCTRL_SET bit is active in the hctrl variable, the driver passes
the uninitialized val_buf as the tx_buf argument to nct6694_hif_xfer_msg().

Since tx_buf is not NULL, nct6694_hif_xfer_msg() then copies it to device
memory via memcpy_toio(). This would copy the uninitialized val_buf content
directly to the hardware shared memory mailbox, potentially exposing kernel
stack or heap data to the device firmware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013063259.2734=
757-1-a0282524688@gmail.com?part=3D12
