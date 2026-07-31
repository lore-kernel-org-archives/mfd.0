Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6B93009D4;
	Fri, 31 Jul 2026 09:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785491136; cv=none; b=sjXxgfPzJeRCJL41PRiyWrE/2XcHz43VDxO4XYVWUpNjYgDVKC4B4v/j93rUx2gFuics/rmoUnHd+xR603s9F0R21p6ZtJNWY+TCI8ou0h1YOUZECvsFyk5/GUtVJhSljhu11jlgPtr3hqx9pdoZNXWPUWXcgwb0GCfjznVQxUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785491136; c=relaxed/simple;
	bh=dSWDbcLB6vrH0Sd9t5DSADLQOQQD5NE5JVH4aRXK7Bc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FoL6ySyWcjbHmOpRK5U5ptjqoLsRDP8tbvOXxa3KQJidGObicDmLn3iTszp3nr/kbApvgarWCC9HhCHzsyZJz6qwXA5GF3RdHhrbS4qVSDMp2r52xZYRpEwy2NQlo1LibrO3fa11sX1U/Qh2qUiKidPMsiaaCR+L0PrQfSgI4nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1KLPcA3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1KLPcA3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB5C1F000E9;
	Fri, 31 Jul 2026 09:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785491134;
	bh=dSWDbcLB6vrH0Sd9t5DSADLQOQQD5NE5JVH4aRXK7Bc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R1KLPcA3wmaz3x9jfbpk7gtoTJ2eqOovU4RalimdT7+CUMST7ZBULhpVMOOvMhu2a
	 TyNA2q2wPHe5FmxM/WSe/hf4VY6ppXY7ZVa1gXX5DqvhiPv2huTEoiKjYcj2g5IZfh
	 e9Qa2LJfbK6RmVGkMwHOAiO+sFDe4pqwaVCDwNO1pw5epF6aSeFHwKlUlgTOE//LJa
	 y8WlFKFiI0BePhXh0IV4b3qRlMr1qCnzOAEl8uDCwwwHEiA1cVx6JmZ0jgKWyZFjiN
	 0CzOFLEwkcxj6XLMfF0qBAs2QoxL3t9VBSUrI90Te89J51Tv0qWaSSh7jCZ/KDpjrN
	 vXztTYbwOvzLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: mfd: syscon: Allow syscon
 compatible for Loongson-2K0300 chip id
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <0fbb8d766b6ed33bf4ae9b066eac174f55ae5b56.1785480242.git.zhoubinbin@loongson.cn>
References: <cover.1785480242.git.zhoubinbin@loongson.cn>
 <0fbb8d766b6ed33bf4ae9b066eac174f55ae5b56.1785480242.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 09:45:34 +0000
Message-Id: <20260731094534.8AB5C1F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785480242.gi=
t.zhoubinbin@loongson.cn?part=3D3

