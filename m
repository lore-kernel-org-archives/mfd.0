Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0844EC64C;
	Wed, 16 Sep 2026 13:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564714; cv=none; b=XTKhUBLW5AqxPb7ba1gzInDZkGxSdEdFbjzTPomr9+N6b/YnSa3rJk0dzr8Sh/lSou/JWlRR9MDwg2/8Cmn/dloh9pMNq0hRSosezIqJ6xS9MredXg/Y9WtPnJkrFyPBUmIGDzjhbKq1o4Nbr1i57laOKfn1uktgFgCEiWJYCfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564714; c=relaxed/simple;
	bh=8sToaTrFNzj5akvdCNHMdQ99Q6fypTDywApgpuHzOPo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TYVWzVvUDBKmXozB2oZPQzFiEwWVrSG2BEaIovQujjDRTQWA3ccvwxaEySZDbYx7new4txac55QO0nMSH9e1OK7wLUeXSOyix1DaDSYKRr3e7emJRWcRiuIjctq8p+FGt9wNMFJcAnaCcXnBup0SiAZjYs0kbRwepmGDxg8vHxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCUSv/AU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCUSv/AU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9784F1F00893;
	Wed, 16 Sep 2026 13:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789564708;
	bh=8sToaTrFNzj5akvdCNHMdQ99Q6fypTDywApgpuHzOPo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hCUSv/AUxdbJPS7kWOHBqjXkhQjVFHsyTccb1oY1QNOIhW8SdJbtn+9sKvsZuS6wk
	 P/LWfnStTZ2kLiZSNlKM2teaC8xdnpamrzY91O/CpKpxsT8HIui3W2vXrkuMIUr3BD
	 ZEUcyeUIdI9fFxlIJxX5pWpjFYtz8NnMIaT4pp0tYgHIK9mjQD6nswRVXtEjqETCRO
	 Q3ED/YaStDiGZr3u2A2g9UQ+sE8SZVSyyXhnkiuIb4OgCzZ362i6wln7CXKlAVCX2e
	 YKlJb/QzRapY0O9r1dD1aXU1KE1528uQa5Iv45y/aUfq2EOCYLoSMHLgkjncC2W4Hr
	 Vik9aY/gS6K9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: ti,tps65910: Add wakeup-source
 and GPIO hogs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260916-ti-tps6586x-v2-1-f12cfdfb446c@gmail.com>
References: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
 <20260916-ti-tps6586x-v2-1-f12cfdfb446c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 13:18:27 +0000
Message-Id: <20260916131827.9784F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Device tree validation throws warnings for the TPS65911 PMIC on Tegra
> boards because wakeup-source and GPIO hog nodes are not documented in
> the schema, even though the hardware supports them.
>=20
> Add wakeup-source property and allow child nodes that match the "-hog"
> pattern.
>=20
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-ti-tps6586=
x-v2-0-f12cfdfb446c@gmail.com?part=3D1

