Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86236468C38;
	Tue,  1 Sep 2026 20:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788293336; cv=none; b=G1QZFLv4TZvn95fI5YDBPvPY/ATByznm0YtC595SiqimhbmURRHMm3MJgNGpT8bcNaGYi6e63uNT6eBmwzSZNXFDq+WuR6D1EFO1FYXZ+ZQ35rbacEKNjY9FKspGnv2Pi/T3x4ZkEHda4tFbEHPCiixVrkHbC//uDayczvpkSuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788293336; c=relaxed/simple;
	bh=WIVfHuFN0KO1Sff+MBb/JauRZqAfj1JzFVgLLN1DgnI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e6nHlNZo/w1KRZ2XDz0INchxu1UvqaDfsKwWmwAGDi5rNPrRnY/riBKsMjLeLGZH6DxsPSchl61BfXxgO2RvgDj/EYTE0iEDqLW03dBLy+GJyJINPuC5za5FOfn5eFNVy7DvQ27bulEZ5VlUFW9wNUKneCUYPfw9sy44rD7+/zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnN10RQT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnN10RQT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 349C91F000E9;
	Tue,  1 Sep 2026 20:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788293335;
	bh=WIVfHuFN0KO1Sff+MBb/JauRZqAfj1JzFVgLLN1DgnI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FnN10RQT19Qok37UOVDjs7KnwoHo9aGCA0P1X01vWc/LRy6evLC2exFefDVmh31/y
	 xWFfA78WZUJ81hd+DRjV/dfHctK3uk+UMNLo0Mut8GG6jibte6cjd6khA49L0LcGRZ
	 3ceIfV4VUuU8Pb9ilFbfXUbpBCzNuvKUHvP1nfIcEM4/uuMyXGgNmxqeaCHOpIv7xk
	 ToxCXlkxVE6w1GPQcHMC8ZSiSEkGFRN4RpRZ2OcFKWj7BL4gMzMpsdCxJ0Yk4V8Z39
	 BY2oeWdG5sPwE06/JGqudMZpRvkjy24li80hhejbWpUlR4eyeL5jVT+UZv6UkUMT0o
	 vmLp/hQOeKelA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/13] regulator: ab8500: Add AB8505 VAUX3 3.05 V
 setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260901-ux500-dts-snowball-regulator-v2-2-fe88b01829bf@kernel.org>
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
 <20260901-ux500-dts-snowball-regulator-v2-2-fe88b01829bf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:08:54 +0000
Message-Id: <20260901200855.349C91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> AB8505 has an additional VAUX3 voltage setting which is not encoded
> in the normal three-bit selector. ArmRegu2.Vaux3Sel3 overrides that
> selector and selects 3.05 V.
>=20
> Add the missing voltage and use the override bit as an extended
> selector. Program the ordinary selector before clearing the override
> so VAUX3 does not briefly switch to a stale voltage.
>=20
> Reference: AB8505 User Manual, DM00046744 Rev 3, pp. 229 and 254
>=20
> Fixes: 547f384f33db ("regulator: ab8500: add support for ab8505")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-ux500-dts-=
snowball-regulator-v2-0-fe88b01829bf@kernel.org?part=3D2

