Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C293C175A9D;
	Sun,  2 Aug 2026 21:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785705965; cv=none; b=fZxiTQ6OGneatJ6jr9B15OpxyJdLL0gERu7It+sOh8Ny40maCbDLMnqVi0rwyqqZT55lE83ivCw+YKkTxr2r27kO1pBX1fXdNkgDVQtBfJPB0IOmdiT6Fppg5rFpB0NjNtgjwCXL02MDVQxSLYzP1YDmljPDKGP9mJBZvUv/coE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785705965; c=relaxed/simple;
	bh=0gkFw9OMVdRNv6WvW4l3U8SpNesPnDmt+Ie557rJdLQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OyYHK3OuI8VVaa3zol2SiGPR++4VfbV3PDBUOIZGiyq40MVwqJUSkDjHymlB9X5QPsPKaVCCNrmLeJ2XrcIa2GtlTeIpfIGadYafqPOgvZOcff5kC3LVIDN/KQcohSI85koxhpYeUTwH2hrNMOI0ycSuFdRWHevHCQSgl2ewqGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WPvM84SC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WPvM84SC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D401F1F000E9;
	Sun,  2 Aug 2026 21:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785705964;
	bh=0gkFw9OMVdRNv6WvW4l3U8SpNesPnDmt+Ie557rJdLQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WPvM84SCAwFKe9STRRdRIJfLGMyHg154aNpjSRXWjs2RLwBXAX9reYD9FBaYtpG7R
	 S/BmTwMLMmg7zHL5yKDBvN4FpAAMQzOZ/O/GgcIBajUUjxiXI4w5iykWWF8Rtnzj0m
	 Fqq08nXxKfi6N7mRni7NV4LF914GN+F1QioMIAYS7r5xzBy8YbtQCV8m09abL5wpbe
	 voO3UyCf8JKenmd0dSjltzL3mo+jK6bBdRGa4NV+HMlfoGObviztcf/zcBqt36F6Zy
	 ZUhRQCmVUWrUtd0jMJE3A9JbJguvMBCsjcXph0gjkhIFYK8XDlx1/IxUUNWoc1MV1W
	 JUxEdt1Zkj83g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 09/12] clk: zte: Introduce a driver for zx297520v3
 matrix clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: mfd@lists.linux.dev, olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260802-zx29clk-v9-9-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-9-d05530d85d28@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 21:26:03 +0000
Message-Id: <20260802212603.D401F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> This clock controller controls high speed devices: CPU, DMA, RAM, SDIO,
> Ethernet. The only non-clock, non-reset registers I have spotted here
> are hardware spinlocks.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-zx29clk-v9=
-0-d05530d85d28@gmail.com?part=3D9

