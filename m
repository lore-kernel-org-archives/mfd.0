Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C9438E5D7;
	Tue,  4 Aug 2026 12:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785847784; cv=none; b=QjwpXx/yMV2xZ/xSBO/SoEi68rIXm8IRYcNkhA9/j+cQe5RBAJfldnMv6lYVdPjlNYl043/knZ/tfBL+XpggtwIKblUEtSEWFXDLagm+nIHEZvIkR0CXlm6BLKVV1QowYaEmIB78XMBa6/HQTpRmtJ8rg+jMp+SkBLFqV1eoXq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785847784; c=relaxed/simple;
	bh=e8iVPjb+iwLd8Whp3+AIZ0nnPg4LsHTE+34vwRnxxJI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NEpcHzXY5tWOHy2EaF7z8GI+zD7EPmzd88QnVG9nzvRDoyjuxGZP7wbDHTbe7vR4eIgt2hWZ7Lk4fLsFud2A6zb3aCOFMHCdTAnKaMn9MldEX7/KcGdVlbAlcmr3TcDOOPOd+ZeKfntqT/WUu5fQzxS/NIkf4keJeJ4Abx+smqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ayeDTUYO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ayeDTUYO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB81B1F000E9;
	Tue,  4 Aug 2026 12:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785847782;
	bh=e8iVPjb+iwLd8Whp3+AIZ0nnPg4LsHTE+34vwRnxxJI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ayeDTUYOrl3DV/ice16IVpLLcdEGjBU5A9J+EITmLWR+g+ZSsLBUcKLVM84yS5yXB
	 AKFzv3FloFxDMD2Ug06kqIK0+CK1YWMBws9Pxp4ghl5n+1RP7R9wOPYukbGBouBMPb
	 bT71HtpzDcGmRS7xtBAr0mpvdXUFhG+eqJtBVSZ8rNryAe5ndZR7XBWDYTQS9A16GS
	 Lvt11QTXFyA1mTt8NxJ3OK+P3U7XDQb99xUGr52lfj03eX9kn21aUOIUPNUkOtDyFc
	 HePvGwo2dyXLCnkeL8V6Ef6V+DH4QNznD/6Pw4Iem5qmdJhDOzSUh7uGhcyFsplxEp
	 pkT/ppbpnDT2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/5] dt-bindings: thermal: loongson,ls2k-thermal: Add
 compatible for Loongson-2K0300
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <93d79c192b18e1e7387fd8997f168fdc6daf9232.1785829933.git.zhoubinbin@loongson.cn>
References: <cover.1785829933.git.zhoubinbin@loongson.cn>
 <93d79c192b18e1e7387fd8997f168fdc6daf9232.1785829933.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 12:49:41 +0000
Message-Id: <20260804124941.CB81B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Add a new compatible string `loongson,ls2k0300-thermal` for the thermal
> sensor found on the Loongson-2K0300 SoC.
>=20
> The hardware differs from existing SoCs in that it requires a phandle to
> a syscon node that provides the CHIP ID register, used as a compensation
> source in the temperature calculation.
>=20
> Update the binding to make `loongson,chipid` required for this new
> compatible, and clarify the register region requirements for each
> variant.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785829933.gi=
t.zhoubinbin@loongson.cn?part=3D4

