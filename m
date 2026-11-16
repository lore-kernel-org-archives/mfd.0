Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851576;
	b=S2kQ9o1sn4lqBs7sgU/T4QczY9amKtXNYGFs6yBcskZd8t+vrhJSvz8ijVN3CPBcti22
	 IsoiuHd+tmGQYPtW+qhRC8iyNNEHZWQB4aYL6tS5P5S+hfWdJuV5I4+hGj5XdgHoSHGvj
	 HfeYTmUSZdrMGz9rvn3jqwsESrpKcb/vWvjRJZN59T2NpeJCS3zLV6hbsQNkVwCFuPp6Q
	 Ofw+Y71PNWGdGjQRdAdASrvr0P3Yb5HWUDb6beOUvoKSry3MQK7vGvw/S+biv4G/NDgvV
	 iU4JSCGPQqc90YO/1dNHJan9zt8bDsDxl+QKd/EcZ8WdbHjw+INCHPwt6yBmrDeSGAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851576;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=J+OLIuXnsLyS3d6jQW6jBFaer9Fd1AxrcU2BvuKBhW4=;
	b=Q6vEneXSKpoWc8zJFRfc0ahzXACT+v1DxBYQv9WDuIARFm45Qp2xgi2eyOvCVzVuEPAZ
	 s8J8reZH2THTqgWvHXksjK6O+Fn1mcrp/pCDegZWkbY9gTR6bKf7pGMR2trkl9j/vOz6Q
	 gpWE6Oopu+6YioTh31LRnDNcUo5ifQoF/18xI4n7PI6EurZ22SpvuDmHMU0H7utM+9dWi
	 mWjC5j8zeMt8UpKe4fuEJGxdPXbaisXBxmfn/EPIA+TSkd+SsSnU9cBZOjUDJ6mKb/yUv
	 XGNtz5H7q4jNTNzAh7JEPCbM498geV6qobHTNJzTlXOqDDeFCQZZGsXaJHBIxCjUB0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hr4bEhFB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC23606A884
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 17:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hr4bEhFB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8B71F000C4;
	Mon, 16 Nov 2026 17:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794851575;
	bh=J+OLIuXnsLyS3d6jQW6jBFaer9Fd1AxrcU2BvuKBhW4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hr4bEhFBMM/h2RJt9Z6fTaoqLFDVHsJ2WsaM7N9426Th3LnzKKuUjm9HU5tJiUtwC
	 0imjSmQWZ/ScxWq7y9gU62kyPYdTnxBrb9VVL0bTDwXDQJ89D/wXATW4mh9wDEb38Y
	 wkw6/W9qWpBFEFl/7SGvIzxSzs2ClilHaFCNx4P4jbwAI/d/DfXrv5SE89QSocTD41
	 HMEbATp6+dIhexYxijuyoCEQkC2DHHYMCREgi7KglRDvgaSwUfArpSGE0P762/nfbG
	 BnF9IXFexX4WGUL/S+3AjTqsvimw8yHpMPpXXYNdQIGfn+G8NEIhaVa12UzYN/F9A+
	 d1dI+S7m9yApw==
Message-ID: <sashiko-outbox-217449@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/9] dt-bindings: pinctrl: airoha: add AN7589
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116174854.342912-7-john@phrozen.org>
References: <20261116174854.342912-1-john@phrozen.org>
 <20261116174854.342912-7-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 17:52:55 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Document the AN7589 pin controller. It lives under the GPIO system
> controller and selects functions through a separate IOMUX syscon,
> referenced by the airoha,iomux phandle. Every pin is a GPIO in mode 0.
>=20
> The AN7589 has no chip SCU dependency and the vendor SDK carries no pull
> or drive registers for it. Groups follow the SDK naming without its _grp
> suffix. As in the other Airoha pin controller bindings, a function names
> a block type, such as uart or i2c, and the group selects the instance. A
> node selects one group, except for pcm_spi and pcie, whose groups carry
> different signals of one device. The PON groups keep the working mode
> only: the SDK encodes the driver reset sequence as extra pinctrl states,
> which belongs in the consumer driver.
>=20
> The pwm function routes a PWM channel to one of GPIO0 to GPIO15, with
> one group per pin. The pin also needs its GPIO output enabled, so conf
> nodes allow the GPIO direction and output level. Pull and drive
> properties are not allowed, as no registers for them are known.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116174854.3429=
12-1-john@phrozen.org?part=3D6

