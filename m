Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADD64A5ED6
	for <mfd@lists.linux.dev>; Fri, 25 Sep 2026 13:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343962; cv=none; b=MlqSG98W1D5VUIgXx0WCrRl4qf2uq7ctMdXWfNGe0C8CUT3erIMSBduiA9U+OzCQvZxEQZqIvgsa3LGvoElljrnIdOH0D+4hXgoxsUGemMGHQk68Klml1lcWB1t9vudQFKN8fPyKwTY7SwM39IjE0mueYj6XDW491P6iUwzJ5HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343962; c=relaxed/simple;
	bh=SqkBG0KRwtW/njkq60K/wp+qNF8sZRQBsdIcBlg5WrA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P+y3/8gcsRBXsKvKtEPQyZlRGvodpA+ISUUQwo+K0amNUEInJ9+vq3PmgJNkRnHvf80+aoIqOQV3n2UePYXdIUIOQJTtVR4+Apg+ii6rlBGNgNB9Eb4Li5F+hzIwU1MWBRHY2603b10UDTC8kKIpybVh+XjQre4YBG8LQpPkjEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TELdrESH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TELdrESH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADB31F000FF;
	Fri, 25 Sep 2026 13:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790343961;
	bh=SqkBG0KRwtW/njkq60K/wp+qNF8sZRQBsdIcBlg5WrA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TELdrESHfuOr8Xow1OhZ7QELHnyizIGxzDdMdQkyKQzc4VYRLiZNBSbqQn+Dp1WVn
	 9q13RwgeOiIjvbW+W+5pfEsZNcol21iX8Mm1H/rilrNZt+qpa78tZeyS3mxA0tfaS1
	 LeaST+SgM5pKojBK29he+v7E3uyIkHKZuTvfH6xL/+6ww66yX4g3YtVOKyfT03TLL1
	 F7Gu3Jse5wbMKWn+n4N+TTAae1RkU/jx6NIOEEHnGJ42jTx7cHg8OVRZDwGpFbuAnu
	 TF1BKXJAUZ2oTi8yDdc3EqqOh0vxTwtHSTFuDFtIRxvlBFruWB0MTctY79uAyFjh1x
	 ftMeazdjH2xwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: mc13xxx-spi: Reject devices without match data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiale Yao" <yaojiale02@163.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260925133751.2230782-1-yaojiale02@163.com>
References: <20260925133751.2230782-1-yaojiale02@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 13:46:00 +0000
Message-Id: <20260925134601.4ADB31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> A device bound through driver_override need not match an entry in the
> driver tables. In that case spi_get_device_match_data() returns NULL,
> but mc13xxx_common_init() later uses the missing variant data.
>=20
> Reject devices without match data before entering the common probe path.
>=20
> Fixes: 15d71e678ec1 ("mfd: mc13xxx-spi/wm831x-spi: Use spi_get_device_mat=
ch_data()")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925133751.2230=
782-1-yaojiale02@163.com?part=3D1

