Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAAA44E67E;
	Tue,  4 Aug 2026 15:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785858952; cv=none; b=GJkecg9/ZoU7q3+9/ymSQu1dPuAJ21yR2BLc754/GtEWgiVFqcAf1mEEnCyF0JVtJDfS3whWxcGGjtKgbQVYzE3Zrc/sY/YBesH5qHmLwjaSG+2+GD2NkRWkJ5xsrBBBctzlK9coqzXDlIpUT9AJqD4rlK3+uL+Ej2bMyNoL9jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785858952; c=relaxed/simple;
	bh=J3TYT5K7mxczJvaaQFNqfxCkEx13BWE2hEe21tSye/I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YQtOiqrZ+17ovcdiMECJNhULoTzeS24P1VkzCtSke6nZKilZfYSn2bz5SKZGZs0Secps8nzobDI3NZgkqJXNjpzPNSTw9rkdkUJXI2uMTsaPX4bLYj7FOCS+xqr+vyp8CDEZpQNFgltHT2U9FvEEFfO3G4ASphL5piWTbVPZzgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AhkPYoXD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AhkPYoXD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A818C1F000E9;
	Tue,  4 Aug 2026 15:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785858951;
	bh=J3TYT5K7mxczJvaaQFNqfxCkEx13BWE2hEe21tSye/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AhkPYoXD1GYgYuOl4cEYFsuoB31d5b72crBSXGyVQNibr2WvK+H5FGlA06ERPqiKn
	 zKQAVcosEtQRYI+HMyk9g61OS8rKtu8RfwOk28Dx8mJCsDRlDhgw7+s+RATDUkL3UQ
	 qmlxvLFMf7OicBMYM4u09St8bSc7wZSOHbYgiIlnxkuWCPqSa6hCaBxzjooHEIIJZt
	 pEaiJIpMTXI9qa9rixTSvfNcc732QOkc+0UytocYTcsRVzQsmuSubX5iKdu4GrjvMk
	 LPuOuW2l8sNcNv6iO2OSV0lQei79ipkiOG0mxOjpohiQhnsotCH6Xu/7w/ZZ4SaC8F
	 xOb3eY3jpgG1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/10] dt-bindings: mfd: ti,tps6594: Use generic
 power-controller schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260804-mfd-syspower-v1-7-a440783c2e78@nxp.com>
References: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
 <20260804-mfd-syspower-v1-7-a440783c2e78@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 15:55:49 +0000
Message-Id: <20260804155550.A818C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Peng Fan <peng.fan@nxp.com>
>=20
> Switch the binding to use the generic power-controller schema instead by
> referencing power-controller.yaml and removing the local
> `system-power-controller` property definition.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-mfd-syspow=
er-v1-0-a440783c2e78@nxp.com?part=3D7

