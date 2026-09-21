Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505B74756BB;
	Mon, 21 Sep 2026 23:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033513; cv=none; b=RQO1yjwR0lNFce9wFPkvHUN67FtCnp5L2NFLN9yJMM9KIToQ6L9PnEFNvQW60m6owZuJ0edfbObNq4z9z+EDUUZY1yEHIvRmSvug3nLqlIJxa3uelu3vcWySs97L6MLDsKIXRxycFMwUT556PUapqgYwxGdNllLbYUH1PR7pyho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033513; c=relaxed/simple;
	bh=jHfgA3tNHMVt6gW//NTn0n4fB3HG7WWVoeK2quZhE9Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JoMVaNAGvXyGx2ThJQFYAs5xc0T2PfuwXh8azFCknAwPkNuE7FREYuj1JBktZrGd+fCJGTAbsaRbTayP+W1xhz2dfX8FT1zdv42TgdGHNaAQEvY9az14YrH2akUooIG1p6CaE/G7AxsDmVAAeu1UXd8MiStDVMB6kHQlyKQEdNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YyErKP3d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YyErKP3d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38611F000FF;
	Mon, 21 Sep 2026 23:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033509;
	bh=jHfgA3tNHMVt6gW//NTn0n4fB3HG7WWVoeK2quZhE9Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YyErKP3d5eWTTGjpgz9U7LUovEIg9Cpfq+BQK/lnD8Ds7Iq3ZQfvIF1HhFEIBLPZO
	 8EGtdzup2rPoRspyunJxAlVCbdJF+nrn3Y+9gWDYx5tzFtv8rtxL7FHr811qQq3Ld7
	 AAagcM+ABwIxt+2gT043yguqEeMRc3FqALztgsrx4HM2+iGglIrHtXbZ+sYZAQ56K6
	 ALPLUGre6AbKR7Xlu+8d9dSO0ZnMITUggsOI5bgsVQM/0+5ORq2Mbz7ZrJ8jc25O8+
	 KCXQ6SH+VziN/E6oDS/mzN2hZ4YhxXcc1Ix8iaNq/qayKpgb+PNzh4qJCnNzW74Zk1
	 CA/BPQhE6CKKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: mediatek: Allow MT6357 ADC
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260921232632.3131680-1-robh@kernel.org>
References: <20260921232632.3131680-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 23:31:48 +0000
Message-Id: <20260921233148.A38611F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> MT6357 PMIC nodes can contain an adc child using the MT6359 AUXADC
> binding. Add the child node reference so the ADC subnode is evaluated
> instead of rejected.
>=20
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921232632.3131=
680-1-robh@kernel.org?part=3D1

