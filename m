Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6119E3E6DF4;
	Wed, 23 Sep 2026 19:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191452; cv=none; b=t1Uq+4Lmc9vMVemh0TkZN94+5s4oe1y8cxoFqcrZjNnGSaYVzeioAp5IxPdtwklSIPWbOcD5n2khVIMjOgVl7aWU1wU/1uovo7fuTL1zrtp00UcdlpnO5cUSwkYVcmk1oZC5ewGDsXKFNLl6sqmmvcDv0o7FI1v4IdknzebZSdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191452; c=relaxed/simple;
	bh=QVN90rfQVFK7Dmpo3o9r37JC/eWmO86qZcc4YBdwHhg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IharJ7dOQqwNTSqZeI81ON184BNGpb4Wf14gHNRrhlGVdyqqWc9yjgVmIpU+D8G3aXqzrpq7DorQPCmxDQpaXI1uCQs58l+psZvCJtXE5NGMDVLgYT9+EAlLxffYb93TV2Jnvt8KjXzmyXDFj5ilm+3KKZrTHUOV1zHQbDJjCyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d70OaZhx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d70OaZhx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D59D1F000FF;
	Wed, 23 Sep 2026 19:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790191451;
	bh=QVN90rfQVFK7Dmpo3o9r37JC/eWmO86qZcc4YBdwHhg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d70OaZhxwG4kFBOGkIkiyxDonAmPAVi1Wz8JAHOOeQa8arfkDrJoO2Xpw5lRiHP+Z
	 vDRYPMFLkdj19Rpdv7DbSA7u2EL46tmtVcKG5X4GMzVmTsGtIHrM/HRjRqK9ey1zgi
	 JVPrvQ1Zz+efQPz8i98NoW3Lr2de5SNvC/jCJw8ktizS8WF2QXS/t2WMSwoRylwHF5
	 OJuXN296HlrWJmHkrjgdBwnspdybKNWIvmrQZ1dnaEz8VV+IEQJMDVNnonSQ0j53Gj
	 ynO+94Ww7PmHWZZQ2dZ3J08nfx4WauZdTbjBcGPfLDrQwYdrcKQNYYTa6ZWZr+SowP
	 UqcELHt/TGcNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: mfd: hisilicon: Fix Hi6421 SPMI
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923191526.2206628-1-robh@kernel.org>
References: <20260923191526.2206628-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 19:24:10 +0000
Message-Id: <20260923192410.9D59D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Use the hisilicon,hi6421-spmi compatible documented by the in-tree DTS
> and matched by the Hi6421 SPMI PMIC driver.
>=20
> Assisted-by: LLM
> Fixes: dee8a4e807dc ("dt-bindings: mfd: Convert hisilicon,hi6421-pmic to =
DT schema")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923191526.2206=
628-1-robh@kernel.org?part=3D1

