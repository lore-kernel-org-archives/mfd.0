Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E157C4C2241;
	Fri,  9 Oct 2026 11:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544575; cv=none; b=Ix6os9PRly3c5cd75X8k5Qpphm8qeDK5/ig0O/gk7QEMTmfGyCsK7AlKXBDqYzve6Hvu87wjXMRxPY6ePXDEegs/7uEsrSWHTJ3sTReEdHBcGoJGlHFx3e3CWWoC+zaJg3EX0egxoJinnIaSKExWekfQVhdE2vaNxmeVh6VwNrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544575; c=relaxed/simple;
	bh=J9rpHw167lSnDlYFXIzy7r2MJ4K0+kHg+52hQqq4GOA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=WpP+w83ljnfVGrqFszCcIFaAz4dJzr2VGrSiKslVu85cTjLJkJvoZ9y1zSNoUOJsF/S9SS+6gzAA1J4UBUFdhh6tFoZAVaHCJ7Uqt9mCAOswcZu1JQo+pMikPcDpozLsGnKrksr5KzhEHnLqTxKYM4cN+JxFcNl9ZswTwkFMX1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a8QuDHIn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a8QuDHIn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1133F1F00893;
	Fri,  9 Oct 2026 11:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791544567;
	bh=J9rpHw167lSnDlYFXIzy7r2MJ4K0+kHg+52hQqq4GOA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a8QuDHInRKx9Va2AUC0khHN65TruOYQFXVYOGO4xBNFNNdlwzyDm8f+GJz6P2I5qx
	 5CjHJut7iNrz/09a2iNA/RYMWorVqOwm7u/S7+wPXQKCu+Ke2/BKzYiSz/0fAUj2dx
	 HstXZnL+zlxg24WYmV5lGexbl+Aq8bHdqb3I4ERZZNdr2gd8gqa7hO+X5mmtSd2heK
	 U1+jCIfTWZh8kRDP61tKSySsygR2kJycU2aT3wB4l8QXoZFyet/jsRrTet7qnyfQG8
	 dOzsmjHDwjiuuqzrqXKCy+ZOJ2rRa3iU6/m9HE2b0InPStPh/WP/e+dY+xvk6Iw/7Q
	 IjMbrl/FxVvIw==
Message-ID: <sashiko-outbox-165339@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: mfd: syscon: add Ambarella CV75 secure
 scratchpad
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: lee@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20261009-cv75-soc-v1-2-808330e93ff1@ambarella.com>
References: <20261009-cv75-soc-v1-0-808330e93ff1@ambarella.com>
 <20261009-cv75-soc-v1-2-808330e93ff1@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 11:16:06 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Long Zhao <longzhao@ambarella.com>
>=20
> Allow ambarella,cv75-sec-scratchpad as a syscon for the shared secure
> scratchpad registers on CV75.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-cv75-soc-v=
1-0-808330e93ff1@ambarella.com?part=3D2

