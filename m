Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446660;
	b=ItHkL4reDiVD3ysbOLnHOpFty08VaL2eAUWLdxqOwn29fbVPGHVMf+F1BWqdqnQ7YFFg
	 8uuTPHV/FJey2FsgXjeuKfr+J/CEwtwQ1IX4BbbOCeDQ1uLGqc+IquwKgJ/0QYBpc/+z7
	 KTGSNUe/aBQEIg9rrtBR+2zUmPQZznerZr/Es8Eo1ymtLS7hE139iCR3pskVICSLdolZ9
	 CRpum26glLaEB51KKkZZxRrVipykyzfC4VtEbtQiHdJVcjeqyUH1IvstvhxFEayW2ZWur
	 EhCCUxEVfQtv3zadGrST/MsWzCcaDbIW4YoSPo+KEJLIOcpW77OhahRtsRfnfzu1A7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446660;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZbPu5orNHcmsqLzhynz9Oj0IZnDD3ZG0zKpfiLF5n+g=;
	b=0JI7Lutd1nQHY2nI+20TegnsbKymfQkSPUHeBSBazoZb8xd9alv2vck6x6boEmVqezvj
	 RDIfcr5egs4ZEraiCG6CC5kkKdJc5plKS+IGzzNkfmzvwO2MsHOx2Qd9A8GQC5Cjtz2Lr
	 5qxcPR8obQOMxaQAC6nQKtalKEK4YuFy3vBevF5BuQ54Ni2kw6AXnv7I4JU2Kbod27JX3
	 /IPqUNy8/KJczxB+kWCrOkqn73xuUmXBoBg8kDcFeTiCQ3L+AWQ8RUY+FCGqY1pyRrn7U
	 RQID47JVUQbZELWYs3ul6k5wG3WkLKkt7uHP6DvJqWkfmuSYjKN397bbCLhKkMAFo8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J+WLORub;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05893606A31A;
	Mon, 23 Nov 2026 15:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J+WLORub
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A841F000CF;
	Mon, 23 Nov 2026 15:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446659;
	bh=ZbPu5orNHcmsqLzhynz9Oj0IZnDD3ZG0zKpfiLF5n+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J+WLORubwAmstBUoLEcIfyaxK7E79KcRR/ndPrCPpyXNt2JJMyoxaOe+hDKo+zWR7
	 1uxOgasBaaD51lDd6G0lmYiyLA1IOK8wilVArRt9JM8bfJ5x6JpjNXUgulb4Jf/9s5
	 ep2NOuYdac56ToxbBk50f/7VAR15KFx2pgPLNi/M7+LFUY23Mbw8ZPDSSOpKYIm1s5
	 ty6BH/vb/e2akGXqxBS5MKbWu+qswrvBc08q9vprXKsrRfVb82+RdT1cSLPzfSjZ3e
	 Fp4uHZY+s+rNHORkCLggYfr74VSr5Imcfpr4AR/z1ZOngzOtidvThset8vdTmq0t9A
	 yYfX4EUyxFfkQ==
Message-ID: <sashiko-outbox-229503@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/5] mfd: max8907: Convert to use device managed
 poweroff handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261123150224.199601-5-clamor95@gmail.com>
References: <20261123150224.199601-1-clamor95@gmail.com>
 <20261123150224.199601-5-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:10:58 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] mfd: max8907: max8907_i2c_probe() drops
  maxim,system-power-controller check
--

commit b8bc64d186feb8ec318721e193d4a0bf70c6eebf
Author: Svyatoslav Ryhel <clamor95@gmail.com>

mfd: max8907: Convert to use device managed poweroff handler

This commit replaces devm_register_sys_off_handler() with
devm_register_power_off_handler() and switches the DT check from
maxim,system-power-controller to of_device_is_system_power_controller().

> diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
> index f1cabb666d8ed..5d17971a8e9ab 100644
> --- a/drivers/mfd/max8907.c
> +++ b/drivers/mfd/max8907.c
> @@ -189,8 +189,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
>  	struct device *dev =3D &i2c->dev;
>  	struct max8907 *max8907;
>  	int ret;
> -	bool pm_off =3D of_property_read_bool(dev->of_node,
> -					"maxim,system-power-controller");
> =20
>  	max8907 =3D devm_kzalloc_obj(dev, struct max8907);
>  	if (!max8907)
> @@ -241,12 +239,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to add MFD devices\n");
> =20
> -	if (pm_off) {
> -		ret =3D devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF,
> -						    SYS_OFF_PRIO_DEFAULT,
> -						    max8907_power_off, max8907);
> +	if (of_device_is_system_power_controller(dev->of_node)) {
> +		ret =3D devm_register_power_off_handler(dev, max8907_power_off, max890=
7);
>  		if (ret)
> -			return dev_err_probe(dev, ret, "failed to register sys-off handler\n"=
);
> +			return dev_err_probe(dev, ret, "failed to register power-off handler\=
n");
>  	}
> =20
>  	return 0;

[Severity: Medium]
Should max8907_i2c_probe() continue checking the legacy
maxim,system-power-controller property as a fallback alongside
of_device_is_system_power_controller()?

of_device_is_system_power_controller() only checks the standard
system-power-controller property.  In commit "regulator: dt-bindings:
maxim,max8907: Convert to DT schema" earlier in this series,
Documentation/devicetree/bindings/regulator/maxim,max8907.yaml keeps
maxim,system-power-controller as a deprecated property rather than
removing it, and commit "mfd: max8907: Remove platform_data based probing"
notes that external DTBs may exist.  On a board booting with an existing
DTB that uses maxim,system-power-controller, max8907_i2c_probe() will now
skip registering the power-off handler, leaving the system unable to power
off via the PMIC.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123150224.1996=
01-1-clamor95@gmail.com?part=3D4
