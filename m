Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB48749E143;
	Thu, 10 Sep 2026 23:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789081832; cv=none; b=o0NLvH+mrY54MAVavylM27Dd97oyDwJx1/h9CGLSiUkODjk2jkQpdAhUJc/h2R5VAkmJ0+D2Yy4MhIlwbZMJ5mAwCyljZJrFaOO9i/61uRmB8KkbMhRiiuoDqKKP/qz31AVvXfs/eivQL1OzH29WsiWfjiGfX05CjLfVtaVGeTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789081832; c=relaxed/simple;
	bh=OgAiQ1aQdn5nAE71sV/fwuHCi3Cz2rKT5r2+X2B4xjI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EL6FlFK/7gC6n7ySGDv/GgGz31RUzRzVttcotIAQLEClMnZhZreiWRAfeYIORMJKeghk5l9gu/XtixfuSFtZ3no4BJUUQ3y0XQNz8CjD+X+NoPG3tPjvaEgQf3wNDFF6IP5LLSfpZoSclPPLLybySYYpkrizS+C9a1sbSAzkNDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PNjKxaQY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PNjKxaQY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8301F000FF;
	Thu, 10 Sep 2026 23:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789081829;
	bh=OgAiQ1aQdn5nAE71sV/fwuHCi3Cz2rKT5r2+X2B4xjI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PNjKxaQYHbyPw9dAVf0GLWB+d6UPxAhMMyoyCLEOq51Xue8/Y02GMggZxaSj50jMq
	 TfyRyrFf5sE092VPeHkDafDKzvhrPUvo59NjTZGzjrb8sXi5ulwvvZtdKFYJyyqh3I
	 fHM9O4KLm4yVODc2ewFf1JuyCz/cBIQUA03/UJP2h7yBT3eLTKSX337GoAl835DvBU
	 W3pTEtxaNepO75norLdmmYcgHguxQc0AB4zyP1tZFpWjBKqlC8zmXXnBPiYiU0m89P
	 10hR6APtkou9D14QtqH8dgyGc+WeVSeiEXaaSJ9bb0LTHEjZ9ehocARzEh1LENP/9e
	 POiqBlcZ7B9qQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/9] ASoC: dt-bindings: ux500: Convert MSP binding to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260911-ux500-simple-sound-v1-1-6771ac714e82@kernel.org>
References: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
 <20260911-ux500-simple-sound-v1-1-6771ac714e82@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 23:10:28 +0000
Message-Id: <20260910231029.6F8301F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Replace the incomplete text binding with a DT schema that describes
> the clocks, reset, DMA channels and power supply consumed by the
> driver. Define the MSP as a zero-cell sound DAI provider so generic
> sound cards can reference it.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-ux500-simp=
le-sound-v1-0-6771ac714e82@kernel.org?part=3D1

