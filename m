Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=161.97.139.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004145;
	b=yADJt0tZkzrgSAVMw2t95DjpkTIjP/PI2aW/cbcBXmNzT3219lcXFFsmj41NT3BbypLr
	 ZHa+RCTOg1TcBLnP1NPvpEOPDaahY43vDNLwJpqE+HWWpn3xxzu+ML1Rah5gHAM4t52a1
	 oHQH2tv4enXSTmo2XL1zZowXFnchHLdt1iagIF6+0cotJ/8D0ko7QXVpSy+3ErbVNGajH
	 ka3PhhZjH3ZXgU0XAAkWNjJH2hg8yaxQh28L8dcbI8ixGsYy1AoGhcLpP8m0Wicc4gmal
	 TZTFUHfCcCVoWeGqKHGiaCkc9GjjBIW4d8KdUzdUFkk4UmFCX7TUKcBb4P4YG0+ncRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004145;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0zj1XD0Ryut6A8MOIvqJTirhV6XFNyu6qbDXF72aYUk=;
	b=zt1z6KGFUGNqnCFFieHYz5lkbCq2soXGHGfqqmp0RehyD1qj2x4UgBA0WxGJTcz61IB2
	 Wijb79Il7hB71DmNXzMPLYZtx8eBgF6Ss66mFHz2dxQosKgvZ+yWQ+TCDKCIFxJuJ0ka4
	 I2rdrm60YK0f/DOrVWxHCLmo9HgWk6GcIgrK6T75S1RXf+wdn+QNYmwicHKcLOKE4Xt/f
	 WFQ7fAgg5PCPvxi52/QPH1UxP+E+0A7FprODavKGz1/vXR9sCM/Kjgb38sUVFlRZTWbc+
	 qfmffehfvAGOBdc/8RkOJuLLWUCS1Ja5/+FnCsZs2sl+UOgBy7R/bDYhRu57rzQZ/Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=SMXpDaga;
	arc=none smtp.remote-ip=161.97.139.27
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2122606A31B
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 08:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2122606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=SMXpDaga
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1xLGHe-00000000inF-1Ws3;
	Mon, 26 Oct 2026 09:42:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=0zj1XD0Ryut6A8MOIvqJTirhV6XFNyu6qbDXF72aYUk=; t=1793004142; x=1794213742; 
	b=SMXpDaga4roMcLBD46LpoC0jsNv7g2ZMO593ajS3r7yC2iXL1vVzz8vcrkutlSIzcR9ErU0sdxd
	Gu6zjpLysOefvN3IdDwaKuXQjtxD9LUpYiUk+QKTejznJSUV4ZGVyUrKcTx4ZVz0XsLRqX7OygYdh
	kDWpRYyViq5WNIx6Vrryl9+TTHpPTvTvmxcJ2ze+WwahoLMhDKasUXmSpggM9umrXWIUx+mP+IsQB
	DAK8ag3647Vv35fLPRsKAYsajnD388sqig3Siv5aUm/Hw9G+8HlmYc+XUDcY/xh3t70k4DQxsy0nq
	uFlVXJGoWgXmpAYcFKBtKEqhACRl/IyZULoA==;
Date: Mon, 26 Oct 2026 09:42:06 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, Alistair
 Francis <alistair@alistair23.me>, linux-hwmon@vger.kernel.org,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] regulator: sy7636a: report the temperature
Message-ID: <20261026094206.2d1e45e3@kemnade.info>
In-Reply-To: <20261026003918.155321-6-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
	<20261026003918.155321-6-pmazzini@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 00:39:16 +0000
Pablo Mazzini <pmazzini@gmail.com> wrote:

> The separate hwmon cell enables VCOM at probe. Report the temperature
> from here, as the TPS65185 and FP9931 drivers do, and under the chip
> name as they do: read it while the rails are on and return -ENODATA
> otherwise. Boards that need the rails on mark VCOM always-on. Drop the
> hwmon driver.

This might deserve a Fixes: tag as it fixes a race condition in probe.
But then it depends on the 4/7 patch, so it would be quite massive.

[...]
> -
> -static int sy7636a_sensor_probe(struct platform_device *pdev)
> -{
> -	struct regmap *regmap = dev_get_regmap(pdev->dev.parent, NULL);
> -	struct device *hwmon_dev;
> -	int err;
> -
> -	if (!regmap)
> -		return -EPROBE_DEFER;
> -
> -	err = devm_regulator_get_enable(&pdev->dev, "vcom");
> -	if (err)
> -		return err;
> -
and has depended on the regulator being registered first, otherwise
a dummy regulator would be provided.

Regards,
Andreas
