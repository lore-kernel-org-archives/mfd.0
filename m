Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6FE2F290B;
	Wed,  5 Aug 2026 12:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933066; cv=none; b=jh+6ynLZMiHKGF2s6NMf7h81VKQWVjvcIjBZu+uTSrAnP8NtdYbkDquMbdhtbRssUJjJ0k7rmkTZQbRMB1OydZE/R+eJIJzoALfqUOwBpTiemMxNkpz/b827YmLLFgR16K9RlFTT2fy0eMafeiVXqNDZAcZqtgcqOfw/xJKhXQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933066; c=relaxed/simple;
	bh=uQrm73y9iNjOO0chxJZlI/N2DKQp/q2nEH6mnO9nB7U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i94GdFtvWRb8AtOfxHuURlsbDhF6FZz+dws9xyBwxigWB09tn30QySb4V3CKLFQOUT5pfqBqVlKlM3yXrEtc8jM5DZ9Db3efgdlwoYdWr3LCaOOcRRKYOtZSVGPSuC/T1E5lUJ7LqmlnvW2d90eqqrFCsDL0MtOMHZIAiDRgWZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0A9oBAm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0A9oBAm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E0E1F000E9;
	Wed,  5 Aug 2026 12:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785933065;
	bh=IpYEi/QHGjO2h6TtGpVfJnEJpazUMItfoHKFhho3Wg8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i0A9oBAm1Uqb/EQNM4Uaw9e1LEMBCP86dacYygDn0LUetHyBfL5AKF7nBRl5hEPQS
	 Xs9KoMEyJ3vKWRxu9yHSkn1tCgAU9wI5E3uz8hAmf2xyJtc0UUXJfksAA18gV4H+So
	 6LWtETpKXJmvJ+o2SpR/yU8bnRoTbrjSkcIq/OneTbGPa7u2X5TX4YE2DX6j5Zz1LR
	 kKSraEuHlPGlWGEAZVeI8CzjrLJKrWSYJPAF5T/IPNz3ruRFf9e1KNI4DW7sQWoucZ
	 AskRjyC15jyCxZ7eqIhBmDTMzDihbwt+QyJhegc9c6O8u0eNwMiDDaD3G/lW6JpSe7
	 bMyjVvvkkAzVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/6] serial: 8250_aspeed_vuart: add
 aspeed,ast2600-vuart compatible string
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <56aa0a5e26ea76e4f9a27ed059d2b05bec9cffa5.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <56aa0a5e26ea76e4f9a27ed059d2b05bec9cffa5.1785932211.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 12:31:04 +0000
Message-Id: <20260805123105.42E0E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Probe error paths leak the registered 8250 port and timer, leading=
 to a use-after-free when devres cleans up.
- [High] Early sysfs exposure in probe allows userspace to trigger a NULL p=
ointer dereference before drvdata is set.
- [High] Late sysfs removal during device remove allows userspace to access=
 unmapped IO memory.
--

--- Patch [2]: [PATCH v5 2/6] serial: 8250_aspeed_vuart: add aspeed,ast2600=
-vuart compatible string ---
commit 513026908b64cd69b7d61f618f21a1466256a146
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

serial: 8250_aspeed_vuart: add aspeed,ast2600-vuart compatible string

Make the driver compatible with the ast2600-vuart.
Enable specific configuration for the AST2600.

> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/se=
rial/8250/8250_aspeed_vuart.c
> index 26fc0464f1cc2..6afa2f4057e1b 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> @@ -560,6 +560,7 @@ static void aspeed_vuart_remove(struct platform_devic=
e *pdev)
>  static const struct of_device_id aspeed_vuart_table[] =3D {
>  	{ .compatible =3D "aspeed,ast2400-vuart" },
>  	{ .compatible =3D "aspeed,ast2500-vuart" },
> +	{ .compatible =3D "aspeed,ast2600-vuart" },

[Severity: High]
This isn't a bug introduced by this patch, but adding this compatible string
exposes the AST2600 device to a pre-existing resource leak in the driver's
probe error path:

drivers/tty/serial/8250/8250_aspeed_vuart.c:aspeed_vuart_probe() {
    ...
err_sysfs_remove:
	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
	return rc;
}

The err_sysfs_remove error path fails to call serial8250_unregister_port()
and timer_delete_sync() before returning an error, leaking resources that h=
old
a dangling pointer to the devres-freed vuart structure.

Could this lead to a use-after-free when devres cleans up?

[Severity: High]
This is also a pre-existing issue, but there is a race condition with early
sysfs exposure during probe:

drivers/tty/serial/8250/8250_aspeed_vuart.c:aspeed_vuart_probe() {
    ...
	rc =3D sysfs_create_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
    ...
	platform_set_drvdata(pdev, vuart);
    ...
}

The sysfs group is created and exposed to userspace early in the probe
function, creating a race window before platform_set_drvdata() is called at
the end.

If userspace reads a sysfs attribute (like sirq) during this window, the
handler will call dev_get_drvdata() and receive NULL. Can this allow
userspace to trigger a NULL pointer dereference before drvdata is set?

[Severity: High]
This is a pre-existing issue as well, but there appears to be a use-after-u=
nmap
vulnerability in the remove function:

drivers/tty/serial/8250/8250_aspeed_vuart.c:aspeed_vuart_remove() {
    ...
	serial8250_unregister_port(vuart->line);
	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
}

The underlying 8250 port is unregistered and unmapped before the sysfs
interface is removed.

If userspace accesses a sysfs attribute concurrently in the window before t=
he
sysfs group is removed, can this result in an access violation on the now
unmapped vuart->port->port.membase?

>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, aspeed_vuart_table);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785932211.gi=
t.gregoire.layet@9elements.com?part=3D2
