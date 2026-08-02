Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701023093D3;
	Sun,  2 Aug 2026 19:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785698049; cv=none; b=XgkTK9OOtTe31iE1MSSfR/cZiWlszaKvkBo+omy3yuQpKTUdfW/0j1UNvmldnS45dQtZYyMtxVbd+qyC0d6EDpy8SC8w04AK/jQ/l850wj/GfKgyQftlX7nWOSCupk3n373dhJfEKzZaEL4whf/ZUYVd71LtUktOQrIJp9MRzSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785698049; c=relaxed/simple;
	bh=Rg8AuwD6U2otjHyIUGCktMX5wPnhjNNg7iIt3xm9Kx4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=syx/g29QrF4hgVfwy3lfKytKWnVLtPv/Sg5nQDAtlYObeHEgXSdWREoYA/ldPU6zpV9aUVtAp83UyQ8R9V57ViIyqIK/eIS2T6iKgV8vejtwFhgeLioglUH5e/jAQEFWZNiDBiIWFSCYrvOg3lOHtQvkaymEELk7zbmWcJ3vYl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2ieq/05; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2ieq/05"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8295C1F000E9;
	Sun,  2 Aug 2026 19:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785698048;
	bh=Rg8AuwD6U2otjHyIUGCktMX5wPnhjNNg7iIt3xm9Kx4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j2ieq/05v4hMKr0ZVrVXd6tVAjd7bZCz5Qx5seQxu8Ic4Jw5DiqZtbaxLkkHjIkqZ
	 bpA7d15MsY7YHmboWWTNVcWbs399LI4TEzHyBbUVXFSurZBjO0ocSVbyAQuqUnoyyy
	 QHFgCNzHYI670F63mekxOE1ASI7tckXMeOO4fQ+yaxV/s91cb+MCT5YY3LuZcQd5/2
	 7NchLCfdN18zE3xI99/mIRlY/aN9D2SnG0p09wj3AKCrMh9kmuhD3Lv2qb4acpaXeA
	 XIQXI7WVTAqkgPQEOBbE7aroK4z3cJ7OxmiZKDMCiylyFkDM3mBGU6hcH5NUCxL3s4
	 iOirg3kvD3Wlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/7] ARM: dts: qcom: msm8960: add Riva
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antony Kurniawan Soemardi" <linux@smankusors.com>
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260803-msm8960-wifi-v4-6-5ffa27aea39d@smankusors.com>
References: <20260803-msm8960-wifi-v4-0-5ffa27aea39d@smankusors.com>
 <20260803-msm8960-wifi-v4-6-5ffa27aea39d@smankusors.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 19:14:07 +0000
Message-Id: <20260802191407.8295C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>=20
> Add the Riva Peripheral Image Loader node to support the Wireless
> Connectivity and Networking Subsystem on MSM8960. This includes:
>=20
> - Reserved memory region for WCNSS firmware
> - WCN3660 iris radio controller
> - Bluetooth and Wi-Fi sub-devices exposed via the SMD edge
> - Pinctrl states for Bluetooth and Wi-Fi power management
>=20
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-msm8960-wi=
fi-v4-0-5ffa27aea39d@smankusors.com?part=3D6

