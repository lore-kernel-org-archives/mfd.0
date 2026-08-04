Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55A2368282;
	Tue,  4 Aug 2026 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785847610; cv=none; b=Ta7Y3BZZmMEGoaPIUrHUpebfTqtrynhkIgKkqOrJ0zwime8xZYxdvIBnlRpXZLxF4EZXaw2TlmjWpeT6YdvkwpvJAUabWV0CH8k56La64MWwS5DKKPhYtb+zLpHbJESzGSuqzjyKCeOjAYfDyP8NvpscFxhZoeExj/wqhwqnMDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785847610; c=relaxed/simple;
	bh=DV+xqtKBS+Jt6YOVAwvmLdBJxBnsZbsx2B+T+izjGJI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uYxM29FHAkA7tukvEGbtn+TbuBLCSgbBfKMIwK7PJkJdghsLpAiworO3TeFuBpoZjSNZoXlCbnhPcMu6+bq5n4re1v7lsfcVgVXy0Q07er3M+4pDuJ+Uv7tAMD8Sw8CcINvV0oGr4cIQfy7vZhg4eOg0w6XqHK/3xIX1K8ozgqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLhwDBgf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLhwDBgf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8D81F000E9;
	Tue,  4 Aug 2026 12:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785847606;
	bh=DV+xqtKBS+Jt6YOVAwvmLdBJxBnsZbsx2B+T+izjGJI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iLhwDBgfYhIf4GSKxKoc51dDg2mYlZkpWl2BsRoz3Qtz5MYSIgwPFbANOqVdCM8o7
	 Em1M9i0ORt8RBxJMG2lHEZCY5Oi784R/ScXZK+GrWhzhpFNcWz6qBzwdtJFG0sDLdr
	 Uu/AJy+T6vZAe1sFO8A5ea3yTTPryugih3sRiHVVfck5XGXB4q32pW3vTSLEZfElj8
	 oLMPqXY3y8nwY1OH3u8NYCUufL+fdSuH/dmBHPlJ/XyjNP71klbuE/trwnhxuXUaDU
	 hkLkF40EU5IBC1/xdTTiKuvH9Jl3UVa/6//c5WkYmVGXUREWQEUh7Wl1yOz6I4YCFm
	 iJmkZ2Q1i434A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/5] dt-bindings: mfd: syscon: Allow syscon
 compatible for Loongson-2K0300 chip id
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: mfd@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <b76405a88b0cded91ba370139d7223fe2d6953df.1785829933.git.zhoubinbin@loongson.cn>
References: <cover.1785829933.git.zhoubinbin@loongson.cn>
 <b76405a88b0cded91ba370139d7223fe2d6953df.1785829933.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 12:46:45 +0000
Message-Id: <20260804124645.EA8D81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The Loongson-2K0300 SoC exposes its chip ID registers through a syscon
> interface. Add the specific compatible `loongson,ls2k0300-chipid-syscon`
> to the allowed list of syscon bindings so that it can be referenced from
> the thermal node via a phandle.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785829933.gi=
t.zhoubinbin@loongson.cn?part=3D3

