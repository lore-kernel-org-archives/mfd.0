Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B0A38424D;
	Tue,  4 Aug 2026 15:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857457; cv=none; b=DVUz7ioFK9AZQ/VazzJiNAtTcMjQCnCjqzM6HADWnbAvDmtJz5+/4WMojh+t/EZy07fy/64V39aFI6wv4bdIN5o20Cm5PJCHyE0vG7ro1luXAaFdbH1uW/fqJ3gJm8PwJnFjd0mkUovS8uxs2ur9BmxMck9sW8DYlecsI+XBnTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857457; c=relaxed/simple;
	bh=BXOjrabChCaKFcmPmrAWA2DuqlNVvQE53517j6CzY/4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ti4PaBfa40zSKofVRuaWL4IbYgp/IXSrkze9enqLCgXV5KnBgieXL6QwsUyz8bZQRU1JHJQOa/zuX15usFnssaVgwmgzdttavtuv2U212eseGQy6qg67mk60gBi2f06tHPFcZAtHPydKbkhBc1hWUMjThsNJR+1t4mpgDjhoDgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTdkFdsv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTdkFdsv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867441F000E9;
	Tue,  4 Aug 2026 15:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785857455;
	bh=BXOjrabChCaKFcmPmrAWA2DuqlNVvQE53517j6CzY/4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZTdkFdsv1GPxLzuo1BPiyqfJ971kjekZNx3NPoG+geWwJZ2Y0959/TCRcTLSfuINb
	 PRQGhEa8pGWHHs9e0mp2bhU36sMrhEIk/IV98kY1ADdOD4RlePzga+pD2eIY+OE3bB
	 dlGnfWwx9Fi9r0hJ5fAxa/zj2C74jtgNqZVGGZDBu+53ctSTb0D5hDWm6gY8gJob3h
	 Gcjh+/6IbZ9EcFVns0A4iGB6/5KQjtg6EQx3D41P941Sw1b7jxqePAkjS7HWipdRbS
	 TcHppjf/BBTu0qLl8dsSChdSRjm6GX09DaxjNFTZ3dyzdykCnFhd75vbI7o4MkGp7s
	 b9EAAmefmN1TA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/10] dt-bindings: mfd: rockchip,rk8x: Use generic
 power-controller schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: mfd@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804-mfd-syspower-v1-3-a440783c2e78@nxp.com>
References: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
 <20260804-mfd-syspower-v1-3-a440783c2e78@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 15:30:55 +0000
Message-Id: <20260804153055.867441F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Peng Fan <peng.fan@nxp.com>
>=20
> Convert the binding to use the generic power-controller schema instead by
> referencing power-controller.yaml and removing the local
> `system-power-controller` property.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-mfd-syspow=
er-v1-0-a440783c2e78@nxp.com?part=3D3

