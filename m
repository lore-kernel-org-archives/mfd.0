Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510312;
	b=Ejd9gkAld3sWUqw6gjRem4IG+B1IiBysKLpiEVzy3DW43Any2WkSqC51i52eStu9K7CQ
	 +GLNyXRQiN9W36a6njjVSEm+o8+8n59B8sgyFRkB1Uy4KuSgWrZrsSXmt6YWYIMX4N4et
	 ybFkyrMswaKgXzzewkgTMrhBcdJQZyvnLHqINuHcKkMDIfusLqIqhurowpEgy4y4D19CX
	 ssXCfdbTWMqdjWx8ZikCYbiVnhuBVegPaDkk6b/RptSsB0+ywUpTuxxb4kGxxMnh3QymN
	 Kr8UeaEmDa+9Ontl6gyyxyyVGKSOUpWXLQMExvuNoHiIjD1paHH8U/hQi5wm/FF/OZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510312;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PZLjuXHVz+vkerDxcGzJwjFA/H25mXBuFyZSKghQ5As=;
	b=iXIBw5K4wZP1XA3W1+ZsJ+yaGhnQVFYnWz9BZ6GOZKT7XIQD/vcSzD/A1cBxzWoTVjl7
	 UHUa28scY2FPSo61FYNtGM74JhndBhBqcbXe9fAIHjInN9iH2WgutwRIghG4hTeFFa0iK
	 NSTFUoxVJ0zERsY2phV/XNgqOuHsypfECTdiAhFMyvPZzbBIb5KoMaFIXUv/QZe8O5asj
	 G8FeVoDUbluy48xcamQb205KqYgFpDxnEgkPtO/4krSEjHTIk8EMUUjDw6ygAI2TJzxpr
	 aFdOnl1NtAhLfCwHRUyDfc43idelFptT0tzxb0azLaXqTLQsIJTFVyCX9PqrKRnzX0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="c/avfLjO";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E790606A31C
	for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 19:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c/avfLjO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B36D81F000C4;
	Thu, 12 Nov 2026 19:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794510311;
	bh=PZLjuXHVz+vkerDxcGzJwjFA/H25mXBuFyZSKghQ5As=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c/avfLjO3FM6DW37QwJy0a5LDGFG0PcVyNiqL7RfXw4QqBB9mxamH1OMg0kdoQWiu
	 X8KRO2t+SCUaOfD1C3G8w4at5HtdzcGGnbcTnoS+R52wRSAM0YHPGZSB1xpAaNBaXN
	 Zp9l17l/rdqIEbOA6DROUCsYMvDn6wbI4rkBEkjpapXrgK7xZgIS5hUOOnhJKXDBbF
	 Hixtd8HbG2RJRP+f7cEy4lnusOHuPEslKir4f7M9n9ZI0oqcnQTxRU1WO8nPeAb/9O
	 fnDNgOQzzuVuGMttHxc6h9RrETP1lsL1+kY4YkgNzRMHjCVEJPjlw5Ui7A3Pfj2gXt
	 lm2YAz191QAtw==
Message-ID: <sashiko-outbox-211739@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] dt-bindings: pinctrl: airoha: add AN7589
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261112185941.1316112-6-john@phrozen.org>
References: <20261112185941.1316112-1-john@phrozen.org>
 <20261112185941.1316112-6-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 19:05:11 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Document the AN7589 pin controller and the GPIO system controller it
> lives under. The pin controller selects functions through a separate
> IOMUX syscon, referenced by the airoha,iomux phandle, and every pin is
> a GPIO in mode 0.
>=20
> The AN7589 has no chip SCU dependency and the vendor SDK carries no
> pull or drive registers for it. Groups follow the SDK naming without
> its _grp suffix. As in the other Airoha pin controller bindings, a
> function names a block type, such as uart or i2c, and the group selects
> the instance. The PON groups keep the working mode only: the SDK
> encodes the driver reset sequence as extra pinctrl states, which
> belongs in the consumer driver.
>=20
> The pwm function routes a PWM channel to one of GPIO0 to GPIO15, with
> one group per pin. The pin also needs its GPIO output enabled, so conf
> nodes allow the GPIO direction and output level. Pull and drive
> properties are not allowed, as no registers for them are known.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112185941.1316=
112-1-john@phrozen.org?part=3D5

