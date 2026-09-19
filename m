Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9C634750D;
	Sat, 19 Sep 2026 12:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789821347; cv=none; b=JTg6skDXt99EBCm0kAxj0Ec5CltKjSlhOvzya+S2ntgN0tS6j2NkYxcJxC2UHPB8SEnE6++uXlcX4xdFdIza3rKkBGN/GXe9IApCcbswtvbYznnjPeXkUz7b3UO8/fko5825lU4unJGQkUBvPB6HueWy0XIIBvkEvUbWXIigngc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789821347; c=relaxed/simple;
	bh=413vZPcankQcqn013EhRmW9RMNURrQKJj/WXhePm9Qg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TzFlz5JgCN6WV26D0aHBfYIHlzmE5nlBpFm6uow8v0JowX/gd1InMjaRGdU9vKQT0qug3dTJtJp9xJLiveVXVUvKaM1RjO9pJWdfnlVqsHDikizi/dDAsgt0EafOXxZgn/n8md4vZ9RQASVI83bJMTJAXBH0GDxRknbEKhTs6dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iG3aFQ08; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iG3aFQ08"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5A31F000FF;
	Sat, 19 Sep 2026 12:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789821344;
	bh=413vZPcankQcqn013EhRmW9RMNURrQKJj/WXhePm9Qg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iG3aFQ08Bf2Yq9/7NYJeRGzIQ56SDJnwDrai5HHU25gSKsxkDX5pgWx922eMCKF+P
	 taytLPmnDX3JAUiTzt7UWx8wKRpQIuWb8EfSr9olSKXwh4ZKFCNcpxX07fKux7iIS0
	 uesQdgtkXOair0RsKLJaCpuj8B0c1k8MPr43eFMWFt7iBsaCjWJCVX7lMreY1ipcEL
	 yHVcIZOpDTMaQW02lYBm29HQzNKrvo4Qp+oR63C9aHX6Q/dEyjTbzbLLdhL143VZDu
	 LvXSx9H+CxSVzGEOi1ow5t3C5Qzxr9lDmuXFlZg2CXDHA0hU0HXaFmTKEJ3KPSQNSx
	 dgZN8UU6OpDAw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2 2/3] mfd: rk8xx: Release the power hold GPIOs
 before powering off
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaozhong Li" <yaozhonguwl@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260919122930.1418-3-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
 <20260919122930.1418-3-yaozhonguwl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Sep 2026 12:35:43 +0000
Message-Id: <20260919123543.9F5A31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> rk808_power_off() writes the PMIC's shutdown bit directly. On boards where
> lines driven by the SoC gate the PMIC's power-off path, a shutdown
> performed this way does not stick: the rails drop and immediately come
> back up, so the board restarts instead of staying off. U-Boot reports the
> result as a power-on reset.
>=20
> Take those lines as an optional GPIO array, hold them asserted while the
> system runs and release them - waiting power-hold-delay-ms - before
> writing the shutdown bit. Device trees without the property retain the
> existing behaviour.
>=20
> The array is claimed before any child device is registered, so that a
> -EPROBE_DEFER from the GPIO provider does not tear down the regulators,
> RTC and clocks that devm_mfd_add_devices() has already registered.
>=20
> Releasing every described line matters: on a Firefly-RK3399 the board
> stays off when both lines described for it are released, whereas releasing
> GPIO1_D0 while GPIO1_B5 is left asserted makes it come back up.
>=20
> Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919122930.1418=
-1-yaozhonguwl@gmail.com?part=3D2

