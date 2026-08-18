Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6323BE644;
	Tue, 18 Aug 2026 09:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043799; cv=none; b=WwTJl05AVIJ6MB5RLMUjCTiva9UDuLeFunCN/GmwLaIKJygqgdIVkxCM4VuOjz+Gkm0bn5UszSVWC7DSfcq7g9nEVpEBzCAXrv/MFaBRzff5j88x0VxX9mFSS/5Eaphr1I55NVKS86Y/s6mv52ccAFGcCFUEju5he0yGik3RKHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043799; c=relaxed/simple;
	bh=vMCuow07DB3mx9HhD/+16t0yilGKzaXJSgc6EuBBMG8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y1Z7KN3IoxyzgIRH5rjbgTen1TJzb3Thod/NCX7zKUdYVPOVbZj91Cm6py+ubGXst8+OaLG7NGP+N8qNWCBnsVNp/0OUBl3OqJjTbDRmvZ0XXLDG0TN51c13LHryXRP2hSde8UkfklQ96LruZpPCxGP0S/xFyvKhyNWX+QIsz9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HYRoLKE+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYRoLKE+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF6A1F000E9;
	Tue, 18 Aug 2026 09:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787043798;
	bh=vMCuow07DB3mx9HhD/+16t0yilGKzaXJSgc6EuBBMG8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HYRoLKE+BaudBu9L09pXVCL2Gmrz3TFszQvv/Hj2/cnOcvaFt0rIE963/Hwe/eefi
	 f6D5BsuN/5oiPG/ROF56oh+fXIZRNVdqQ1rIhVg463liRUmwH6GeRTCBFGT92/JXMe
	 J7JtsK+gzOZBzMeennX3GSJzrahHhQUlbgwyy+5fU/TUlEQvYjRcPzO0lSLrLJInrG
	 eSaBkYzfsoCu7zhFRXig+MiuNZbSj7yfZZpJt/asu2uzDzMeyXE3Fj8scy2v+DdevX
	 qn0gZ2ziEFWDDUj7y61YIxXTKi/mhNoTpBGMiXTWaht5ruhVr2+qUnWvCHf5xmKYLj
	 G9TbQ6KGUykZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 02/10] dt-bindings: net: Document support
 for AN8855 Switch Internal PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260817082034.20326-3-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
 <20260817082034.20326-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 09:03:17 +0000
Message-Id: <20260818090318.1CF6A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Document support for AN8855 Switch Internal PHY.
>=20
> Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
> PHYs on the MDIO bus.
>=20
> Each PHY might need to be calibrated to correctly work with the
> use of the eFUSE provided by the Switch SoC. This can be enabled by
> defining in the PHY node the NVMEM cell properties.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817082034.2032=
6-1-ansuelsmth@gmail.com?part=3D2

