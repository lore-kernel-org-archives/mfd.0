Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A2F42376C
	for <mfd@lists.linux.dev>; Wed,  7 Oct 2026 09:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365994; cv=none; b=qz/j84dYpwqq/07friJvW6oTuO003IxLFvK5dOTxu4AbhEoEwvp4AY921Fzyh363zsYotTHXXBqA/6kXnW5pMTYoKNMkIf72AkGdnyYF4FAxHvBsG7agqtsUD4b8LUTxkZp8crkYSWvN1nB2LWWkOF62iyWeu0xvrw4ShFBEfYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365994; c=relaxed/simple;
	bh=20fweVAgjk/dBKDISUqmVGILZ1EWEleOjASW5NgUNEU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Y4zd5TEtacVkOy+8yqMxsrakSSzQQlOSWvgenVwGmvIypgi0kEJ82l4sgitg7mfuDsoVg7zyl7FO2Iw+OPdeVk5vIu0corFHmB+64cAJOx3QGxV2r02S05wj9/lMDAt0FNcMMpSxqogiwatY7RMxgEu+Rizx+K63xw+nJ8KJxKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vx7jXZT4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vx7jXZT4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C6A21F0089C;
	Wed,  7 Oct 2026 09:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791365984;
	bh=x5WLnFW3aXezPhwghjCaRqoHKv//e5DSn0QPxNjL58g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vx7jXZT4Pyv/7t9UegVZtlGLM0vzlUj/CT9VuOjc293erH8ZjaI3vuQgX6ol01bje
	 SnmYQHXCXLqp8OTFxjH3A9F5Y6DaWO3BYkbTHLulq4Q7+d8jpwc6WnAcNao0eLQj19
	 0qmqZA2XOy29G8sz4iq0OE+oih1+PDnbrASXTgaZN/qsIF5/bwKOo1QLSn+TnNZhDU
	 uSB2ruPK6EQdX34xaF7FaIK6EHdEYANf4XKi5vNscBG4URsfRVWooGspSePmvUDn05
	 Hl03WtC3QTPKCZ+11bBG10oSs9F3KRHK8+RpOKDQkHbOtLE3fsZJ+T3p5bSraySg51
	 yjAKpbM3jqQZg==
Message-ID: <sashiko-outbox-162810@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 11/13] mfd: nct6694: Introduce regmap-based transport
 abstraction
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20261007092102.3768818-12-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
 <20261007092102.3768818-12-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 09:39:43 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mfd: nct6694: silent truncation of large regmap transfers due to=
 missing max_raw_read/write limits
--

commit 057eae63d78f233d0d15c4fc0f83dc841a2be3ea
Author: Ming Yu <a0282524688@gmail.com>

mfd: nct6694: Introduce regmap-based transport abstraction

This patch wraps the NCT6694 USB transport behind a regmap bus, allowing
sub-device drivers to use regmap bulk accessors. It packs the command header
into a single 32-bit register and implements read and write callbacks for
the custom regmap bus.

> diff --git a/drivers/mfd/nct6694-usb.c b/drivers/mfd/nct6694-usb.c
> index 455eeed62dce3..636721f277a04 100644
> --- a/drivers/mfd/nct6694-usb.c
> +++ b/drivers/mfd/nct6694-usb.c

[ ... ]

> +static int nct6694_usb_regmap_read(void *context, const void *reg_buf,
> +				   size_t reg_size, void *val_buf,
> +				   size_t val_size)
> +{
> +	struct nct6694 *ddata =3D context;
> +	u32 reg =3D get_unaligned_be32(reg_buf);
> +	const struct nct6694_cmd_header cmd_hd =3D {
> +		.mod =3D FIELD_GET(NCT6694_REG_MOD, reg),
> +		.offset =3D cpu_to_le16(FIELD_GET(NCT6694_REG_OFFSET, reg)),
> +		.len =3D cpu_to_le16(val_size),

[Severity: Medium]
Does this silently truncate large read transfers?

The patch drops max_raw_read and max_raw_write from the regmap_config
because they are ignored when a regmap_bus is provided, but they do not
appear to be added to the new nct6694_usb_regmap_bus structure.

Because the bus limits default to 0 (unlimited), the regmap core will not
automatically chunk large requests. If a sub-device requests a transfer
larger than 65535 bytes, the unbounded val_size is cast to 16-bit
via cpu_to_le16() here, which silently truncates it.

If the truncated length falls below NCT6694_MAX_DATA_LEN, the subsequent
length check in nct6694_usb_read_msg() passes. The callback would then
return 0 (success) while leaving the majority of the caller's buffer
uninitialized.

> +	};
> +
> +	if (FIELD_GET(NCT6694_REG_HCTRL, reg) =3D=3D NCT6694_HCTRL_SET)
> +		return nct6694_usb_write_msg(ddata, &cmd_hd, val_buf, val_buf);
> +
> +	return nct6694_usb_read_msg(ddata, &cmd_hd, val_buf);
> +}
> +
> +static int nct6694_usb_regmap_write(void *context, const void *data,
> +				    size_t count)
> +{
> +	struct nct6694 *ddata =3D context;
> +	u32 reg =3D get_unaligned_be32(data);
> +	const struct nct6694_cmd_header cmd_hd =3D {
> +		.mod =3D FIELD_GET(NCT6694_REG_MOD, reg),
> +		.offset =3D cpu_to_le16(FIELD_GET(NCT6694_REG_OFFSET, reg)),
> +		.len =3D cpu_to_le16(count - sizeof(reg)),

[Severity: Medium]
Could this cause the same truncation issue for write transfers?

Without a max_raw_write limit on the bus, the unbounded count is silently
truncated to 16 bits here, which could lead to silently dropping data on
large writes.

> +	};
> +
> +	return nct6694_usb_write_msg(ddata, &cmd_hd, data + sizeof(reg), NULL);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007092102.3768=
818-1-a0282524688@gmail.com?part=3D11
