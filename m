Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE8D37A83D
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 06:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791874242; cv=none; b=RF0D3GoW2wcngvqddrcZYtPBLdb6cidEIt9F9DhMJtACsbTnLRBMQV8juD7ZaE0LMrBB+8SHvMWOkNgUefxrulMuPGtiYs95mNi2RcQAlQ1xxIqGWdm27KBA3Q8QUbf0BH5MGN0r14kltLvkZApFNzJPM9+0Uiuu0esF4g6ZBaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791874242; c=relaxed/simple;
	bh=qNDoRg6x4x4keUvCxsuigJhn+2TtBVFyI5IEoOB1wVY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=XulbZitcYE6YA1+1ye6PUtcj5hNZnXSeWNzSNvE52LrXoFTA15eYhvXeV1CcfghOXDG6DPHV64DDGZXgGIvJ59qWwlzU6iHD/1PqbTe6fLUbzCJca4t9hG2RIy9TxmLNjlidVu7q9FR1Jw6Q93G+333ulVUOCYrQpY4ETCTH8Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m3UIuyFP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m3UIuyFP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7331F000FF;
	Tue, 13 Oct 2026 06:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791874241;
	bh=tfRRvLApNTRj8QdCNrprkh6NGXba5RSxizVHwNeU/8M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m3UIuyFPJKxBPsITElzzzQFx4TGq5VvjMBEFEbpJ5T0LToy8j+OTBIyW/c8waPMnu
	 bgkpjO4Ge1gyk75eNRxI/rqgjaxg2WjxFe6gMPq3pPQ5ll9476/LdWRbuUXFxE4HB6
	 DJZ3bCcxoAMrYp5Cl4rOcLqJ8kfZl7D+mByWtLVT9myVZNplPatsM1e/WOGUP2ibeg
	 gx0yUjGBar1xc9nUkD9KuQfsL9hhQIdVWmwezdIe1TQVpEoRyzmsdCVDXFeqWgc21G
	 WyEufXpxfX7UPXsB4UjNZ/NU0uqZhOwdzOJv1HeACp7wGjFFlWg/ZA2uLBrcw/Q/ae
	 yMILpj7ABroZQ==
Message-ID: <sashiko-outbox-169141@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 07/12] mfd: nct6694: Rename USB transport functions
 with _usb_ prefix
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261013063259.2734757-8-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
 <20261013063259.2734757-8-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 06:50:40 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] mfd: nct6694 driver name hardcodes implementation details
--

commit a9e777aed234c15a70849992110b510c5746f24d
Author: Ming Yu <a0282524688@gmail.com>

mfd: nct6694: Rename USB transport functions with _usb_ prefix

This commit adds a _usb_ prefix to the USB transport functions, tables, and
driver name in preparation for core and HIF transport additions. It also ke=
eps
nct6694_{read,write}_msg() as static inline wrappers in the shared header.

> diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
> index 6d75b1485350f..83e9c7ac9beea 100644
> --- a/drivers/mfd/nct6694.c
> +++ b/drivers/mfd/nct6694.c
[ ... ]
> @@ -441,20 +445,20 @@ static void nct6694_usb_disconnect(struct usb_inter=
face *iface)
>  	usb_free_urb(usb_data->int_urb);
>  }
> =20
> -static const struct usb_device_id nct6694_ids[] =3D {
> +static const struct usb_device_id nct6694_usb_ids[] =3D {
>  	{ USB_DEVICE_AND_INTERFACE_INFO(NCT6694_VENDOR_ID, NCT6694_PRODUCT_ID, =
0xFF, 0x00, 0x00) },
>  	{ }
>  };
> -MODULE_DEVICE_TABLE(usb, nct6694_ids);
> +MODULE_DEVICE_TABLE(usb, nct6694_usb_ids);
> =20
>  static struct usb_driver nct6694_usb_driver =3D {
> -	.name		=3D "nct6694",
> -	.id_table	=3D nct6694_ids,
> +	.name		=3D "nct6694-usb",

[Severity: Low]
Does this violate the MFD subsystem naming conventions by hard-coding
the implementation detail ("usb") into the driver name? The subsystem
guidelines specify that we should avoid including implementation details
or the driver's own filename in names, as it creates rigid and non-reusable
drivers.

> +	.id_table	=3D nct6694_usb_ids,
>  	.probe		=3D nct6694_usb_probe,
>  	.disconnect	=3D nct6694_usb_disconnect,
>  };
>  module_usb_driver(nct6694_usb_driver);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013063259.2734=
757-1-a0282524688@gmail.com?part=3D7
