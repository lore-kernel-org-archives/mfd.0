Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49A3244687;
	Wed, 29 Jul 2026 17:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785345395; cv=none; b=ObzywRHQ1lkOfQjsm4RmmNe0ly1dQtPOWTGRV3qU+inGEOTn71tfdIbx8Qp/chTiNXUGZXZQA4IgcMWYQy0VCqJ+C7vNHCSTeBtOgIwZc1lNKl0zaj2GsH+NBkyw/T776mUg7fGgMt7EAtUzk3JRQMQOfjKTHRk/atk1Set8aac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785345395; c=relaxed/simple;
	bh=a2oJG9F8XBNemB1+erxEo8wd6inmHsgk96W5ZEEtKk0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mibFDlN0b8wDATXmpzyfwSdR5FqozF7fTTtQFXFvmK8XTI00RcfG1MVZWLjezkGpc3kiFh2sQuSWPwRnVgritRtEdGVJYRhYYUhytfhd5XsnI5FuCOYSjYFzqz8SjxMKKRv2JCrPEbZw0JZVPbS4GQTGaFWmqcFG6phZBN9dCqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cw/L7igb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cw/L7igb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3491F00A3A;
	Wed, 29 Jul 2026 17:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785345394;
	bh=a2oJG9F8XBNemB1+erxEo8wd6inmHsgk96W5ZEEtKk0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cw/L7igbBNP9KQc3aPSd+YaSwrT5qParEsCwPJ3H+GRB+s3mM8VffAnkROOqMiL0s
	 bJZwZHMUDJ3/9Jc6mMAxHvwxmnZX5P7mRYLInv/qvjKDNiYTsenPKz6UgpUFeQ1T3O
	 AZEeL8M21VH/zdT6OMBeCORhcJc/R0/FLYpIkpQhddU6LZ3QCGexgL0Vsgtqc6XwFc
	 fv6Sv+dIExoSEEBCc3dXtZQJL+qskViKA499CWr6ydJGW+oVE7lBxAeZUJEcz7js2T
	 x5I85tHxSdHlfJCG5EjAzGKcVuiin0eeHYz5+ktfyXjZWvKMh8BpO5AE59ocNWkYIE
	 HlOB+pxONIKYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 01/10] dt-bindings: net: dsa: Document
 support for Airoha AN8855 DSA Switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728154846.1828945-2-ansuelsmth@gmail.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
 <20260728154846.1828945-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 17:16:33 +0000
Message-Id: <20260729171634.0B3491F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Document support for Airoha AN8855 5-port Gigabit Switch.
>=20
> It does expose the 5 Internal PHYs on the MDIO bus and each port
> can access the Switch register space by configuring the PHY page.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728154846.1828=
945-1-ansuelsmth@gmail.com?part=3D1

