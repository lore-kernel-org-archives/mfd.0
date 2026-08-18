Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0665C4519A8;
	Tue, 18 Aug 2026 10:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049809; cv=none; b=qk+bqrYODXviVMLIoNOwNWZt0Bed0CwqQGV39dnMNC49uRJ6TZmhnLtTdH5NJyqoYTVfT6rObG5PAI5Ntqjnb5Z/JWVO9sVNHS/9mAj2evpQy8TPm1pX7+HHFDaloI82quq3lLNzxzHcRTtenoiybrjR5M/N/2yq36NPruACOPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049809; c=relaxed/simple;
	bh=VhQYWr7b7mj7QFlGp7jPEl+3aMM9NcbOHm8c+Uswp1c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jg04Bf/2r+WSh5Lq3cdkXqFWyXeT6BJhQVHk4Hmdq2YLr897R2BMbx4MaadJwPJ0Y3Jj2HJlnj+HpmXeFt+sg7Y5pbCZy6ZqwueJgbNxmbDpHrLsLOXDw/4BB4+R7ICd2WnteuoD2bsgbot1/WNGvlUNyw2Q12hUZNX10N2xiIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQbE2xng; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQbE2xng"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453971F000E9;
	Tue, 18 Aug 2026 10:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787049807;
	bh=yKm5f5VqSsJHEt8ZpHjTgX2bh+UU8SC5cTufM/X1hOo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZQbE2xngCcrCb7R3+rjquLsensQ6mmofKfZjTYpP7rr7B5fEwdwY4FoGovFDtE9Qu
	 7jlA1ZzyTSYnXADYxKvIoz4/Qu+B2xGZg0Wb6Pg9vyCjZ4fBR1qLEqmqKqv1PV4i95
	 dd32IlbDvDO3abA2kKZUaZ8KkK8N9eg753FK6/DlkhjfKUp4oAsNax2bVB7E5OqHfU
	 8y9de+IA4YXUGDD6McC9rRw+ZliO6K8m15AiPaF9bHMJFfUD/4Tj3mV1VlibBTEO8F
	 uNi4nhlwP0flFrwRYofWBhidV3CyrwO3Ohqw39RT7pirA0ncHRz+6fEkDIiy1giAAX
	 myU33ypJ42Lxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/6] serial: 8250_aspeed_vuart: add
 aspeed,ast2600-vuart compatible string
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260818-aspeed-driver-v6-v6-2-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
 <20260818-aspeed-driver-v6-v6-2-fd7cc0b338ea@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:43:26 +0000
Message-Id: <20260818104327.453971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Probe error paths after 8250 port registration fail to unregister =
the port, leading to Use-After-Free.
- [High] Sysfs attributes are exposed before driver data is set, leading to=
 a NULL pointer dereference if accessed concurrently.
--

--- Patch [2]: [PATCH v6 2/6] serial: 8250_aspeed_vuart: add aspeed,ast2600=
-vuart compatible string ---
commit fe8c86639134718c0c590213718a2ba091aac548
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

serial: 8250_aspeed_vuart: add aspeed,ast2600-vuart compatible string

Make the driver compatible with the ast2600-vuart.
Enable specific configuration for the AST2600.

> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> @@ -560,6 +560,7 @@ static void aspeed_vuart_remove(struct platform_devic=
e *pdev)
>  static const struct of_device_id aspeed_vuart_table[] =3D {
>  	{ .compatible =3D "aspeed,ast2400-vuart" },
>  	{ .compatible =3D "aspeed,ast2500-vuart" },
> +	{ .compatible =3D "aspeed,ast2600-vuart" },

[Severity: High]
This isn't a bug introduced by this patch, but since this enables the driver
for new hardware, is it possible for the probe error paths to cause a
use-after-free?

Looking at aspeed_vuart_probe() in drivers/tty/serial/8250/8250_aspeed_vuar=
t.c,
the 8250 port is registered early:

aspeed_vuart_probe() {
    ...
    rc =3D serial8250_register_8250_port(&port);
    if (rc < 0)
        goto err_sysfs_remove;
    ...

If a subsequent step fails, such as the lpc-io-reg property check:

    rc =3D aspeed_vuart_set_lpc_address(vuart, prop);
    if (rc < 0) {
        dev_err_probe(dev, rc, "invalid value in aspeed,lpc-io-reg property=
\n");
        goto err_sysfs_remove;
    }

The err_sysfs_remove label returns without calling
serial8250_unregister_port(). Devres will then automatically free the vuart
struct, but the 8250 port remains registered and pointing to freed memory.

If userspace later accesses the port, such as by calling
aspeed_vuart_startup(), would this dereference the freed vuart pointer?


[Severity: High]
This is also a pre-existing issue, but does creating the sysfs group this
early expose a race condition during probe?

In aspeed_vuart_probe(), sysfs attributes are exposed before the driver
data is set:

aspeed_vuart_probe() {
    ...
    rc =3D sysfs_create_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
    if (rc < 0)
        return rc;
    ...
    platform_set_drvdata(pdev, vuart);
    return 0;
}

If a userspace process reads a sysfs attribute concurrently before probe
completes, sirq_show() will retrieve a NULL pointer from dev_get_drvdata():

sirq_show() {
    struct aspeed_vuart *vuart =3D dev_get_drvdata(dev);
    u8 reg;

    reg =3D aspeed_vuart_readb(vuart, ASPEED_VUART_GCRB);
    ...
}

Will this cause a NULL pointer dereference when aspeed_vuart_readb()
attempts to access vuart->port?

>  	{ },
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-aspeed-dri=
ver-v6-v6-0-fd7cc0b338ea@9elements.com?part=3D2
