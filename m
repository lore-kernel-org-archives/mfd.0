Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FD2363C73;
	Mon, 31 Aug 2026 17:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199150; cv=none; b=ncDCRuVBp+wADFuaZ0yOiDuei+mAo4Qo/0LNi/dhHca1+ga25hWY433bxNQe7t2GOwWry1C5e/BXTlKkfT3LuDiybvWdb4LS7C0OuE4gpOuk7iXQepS28rFLgB/Z3PY9Hba+G+cO/Mj6xzxi4VWNqy9nNu7hGChSwJIEsoEKWfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199150; c=relaxed/simple;
	bh=ISHU0vpoarsfc5ObsXFjiYV49kG8FFeLS7XlTNquseM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P5u6trhH/M3XnMldv/Kz80cZCTwGKxDuioWLP5OyrFdyuUz6oi+oViR7ohFoQAgB8MPUAgHwobaJkQ7bsOLluL3C543LaSY9YnrUSTbwvGanlmfX8vooUcKV1DhWhNeUdCSslB7CXOVB786m/Wd866sp3M4+51cCTiLhwSstNuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9LSc9DM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9LSc9DM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24361F000E9;
	Mon, 31 Aug 2026 17:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788199149;
	bh=ISHU0vpoarsfc5ObsXFjiYV49kG8FFeLS7XlTNquseM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l9LSc9DMmMxVGLHxgiGJHHe3CfOyaqLKW0DV3VknMTgKk56FpZ6cMFVaLO9yzqPA4
	 NdY44IXW79ismnY7/RQ0SF6yokD5n6NOvpNGSi79Tdmc+8WOJYZd5Pt17ytBE3TztQ
	 2he7aOSyzoyxrvfNdF0M97QONl3IPTS+prm40JKTabFPlYwDMN2u/qCipa2AYbZQy/
	 cp0+nDzfvQ5Wl4h7KHniVAbjXgjD4ITSswH3atoZ/1Dv/DfPOTiIs6+0gN3V/j+sTp
	 HfLHMoQCW43/Jl9Q8Oh+EYFVCEbd4fi/zvpesH8mFTcJYf1befZjGQKuDTRJOF0rgR
	 rSSwIhGbpjAzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] ARM: dts: ti: keystone: Align devctrl child node
 names with dtschema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831-ti-keystone-devctrl-v3-1-0614fceba0f1@gmail.com>
References: <20260831-ti-keystone-devctrl-v3-0-0614fceba0f1@gmail.com>
 <20260831-ti-keystone-devctrl-v3-1-0614fceba0f1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 17:59:08 +0000
Message-Id: <20260831175908.C24361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Align TI Keystone device state control child node names with standard
> naming conventions.
> - Change keystone_irq to interrupt-controller
> - Change keystone_dsp_gpio to gpio
>=20
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-ti-keyston=
e-devctrl-v3-0-0614fceba0f1@gmail.com?part=3D1

