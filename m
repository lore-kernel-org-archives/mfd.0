Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8053B1009;
	Tue,  4 Aug 2026 15:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857688; cv=none; b=P6lnRVdO3hzyMakP8UYrZcOtkNGkE5B3vhDZxyNBMOCVPlIlZVFDZBu1l7zQ59lkA2hm0DsErxw9D2MVm+kbj/6X+2f6UiSjOADGssMQRpWRybejNrDtMKM4vdSprhNSWY9q/QIcNpPJgNES5JOE7C+7xzJNjSLW3WQCuk2YTL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857688; c=relaxed/simple;
	bh=xu95LFbI5orDcxrZlGVzr4t877pDNZHxA4AVqdl8fhY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OMEeS3SSlXhYZL9ZIZsQjayaghg5vUi9m4+EWllRgk3mlzFvTZC9sGdS4mEVH0jP0yMtkFK5S7pDQiFN96irdDabE2XTCFkTbSCQD7CxTO3uZuUWK+d39axVmFzY7kAQDRDBmxYCvPtmA+w+GT6S/Ab/W/mua/SUPr4RNXpkMuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DxW4GGWD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DxW4GGWD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4008C1F000E9;
	Tue,  4 Aug 2026 15:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785857687;
	bh=xu95LFbI5orDcxrZlGVzr4t877pDNZHxA4AVqdl8fhY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DxW4GGWD37ctpAK3WzvaKRwdQWPzt+R0/umc8MR7T8kkp9ehKwe/i87WzMlEBw4gA
	 b0iimP1Y0q6EGK6r9+E0UURGzXPwg0YHRegDMS5lzll2DADfy9hBo6WEJJHauNYg+k
	 q/3lxOKfK7QPLGTDUGFnRM0BNgIZW3tB9LcHxgOkZ44Ocu1n6pnRWYD+eOuPw7F/XE
	 D2TQAffP2wQDLX9jJOjx2YIsgbK2X6Yc28VF2sldQUmCGZaUYY4Et0GbN+N3Q1lvZq
	 fqceTpCiLy+UxRPoBTxsFwqa/CPw3mDommca8QJT+7kaJrjJfdOahFt4p8m4D55lOm
	 Ug1b7Jai9337g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/10] dt-bindings: mfd: ricoh,rn5t618: Use generic
 power-controller schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: conor+dt@kernel.org, robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804-mfd-syspower-v1-4-a440783c2e78@nxp.com>
References: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
 <20260804-mfd-syspower-v1-4-a440783c2e78@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 15:34:46 +0000
Message-Id: <20260804153447.4008C1F000E9@smtp.kernel.org>
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
er-v1-0-a440783c2e78@nxp.com?part=3D4

