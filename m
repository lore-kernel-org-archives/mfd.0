Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9336323183C;
	Sun,  2 Aug 2026 19:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785697776; cv=none; b=Z4Hcpsgx4HG8JW3qR3VgDza4h2Csx0Di8g2AzwyHaRjJDzRNoMvjxmIvhnpkYXseceIiEVAEqfhIjbYAqp8Z8ps51dDoSMMzaK/tY3KM/8GHHw1bsHJq4QKyyJ21W5rKO2JFfdP83nlHcws7f2Zv0a+2NO79Ito9C5rChcboKFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785697776; c=relaxed/simple;
	bh=l+CEXssYq2NhG8skOQ2WMlyIMTdjdroZ+LK6/xqeLw8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lptPaEHWBZsjAQsNsbGwgjyCjvJ11Xu01xRgShNWqhlf9ZAUUZ6JyvaYchrea9SjQ7OAuK8rNXQrn0w1ASlLWwW38rXBJqScqywjZ23yyjCzB82x9kqRtqphGS4XchilPY5E8Ybx/1+i/oyiDq5J6xBUM3xAM29ESGxqB/aGXc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d86bO2Nt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d86bO2Nt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83C61F000E9;
	Sun,  2 Aug 2026 19:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785697775;
	bh=l+CEXssYq2NhG8skOQ2WMlyIMTdjdroZ+LK6/xqeLw8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d86bO2NtQ/QlzYIA/aKHJwonpzxkYfE3DNlFmPoxCWio/fzzB4jf+NuYYLrlB5Moj
	 v+FCEbJj0531aOyk/OwrA+e+GWa0qN14xmzymSq9cUUs0vu3JxBRu5P2fyxxOFzg5+
	 wpdd1KvBK4aUMVTBIXanHkot4SjKEszAqTk/gpqExpm56Jw7y6rIQPb8Wr2EaoGjeK
	 4mrBtHsxSGlhoD6EBUbXQGmjZtt2rRztmNONEo2b+hc0XYpGUGgqFAhMmMavTX5rXD
	 Fq/Iy6Ude4OzybLoOwLYZWyEbPIhEcukJN5rZ1e5lySjwWRotTiqU0nRi49Mr4dt8p
	 PtAVr5oMmtOTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: mfd: syscon: add
 qcom,msm8960-sps-sic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antony Kurniawan Soemardi" <linux@smankusors.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260803-msm8960-wifi-v4-1-5ffa27aea39d@smankusors.com>
References: <20260803-msm8960-wifi-v4-0-5ffa27aea39d@smankusors.com>
 <20260803-msm8960-wifi-v4-1-5ffa27aea39d@smankusors.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 19:09:33 +0000
Message-Id: <20260802190934.D83C61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message description starts with a lowercase letter, whic=
h violates the MFD subsystem guidelines for commit message capitalization.
--

--- Patch [1]: [PATCH v4 1/7] dt-bindings: mfd: syscon: add qcom,msm8960-sp=
s-sic ---
commit 1cfd706762cb6881d8994b3ced230db695470176
Author: Antony Kurniawan Soemardi <linux@smankusors.com>

dt-bindings: mfd: syscon: add qcom,msm8960-sps-sic

This commit adds the compatible string for the Smart Peripheral System (SPS)
Interrupt Controller (SIC) on the Qualcomm MSM8960 SoC to the syscon
dt-bindings.

> dt-bindings: mfd: syscon: add qcom,msm8960-sps-sic

[Severity: Low]
This isn't a bug, but the description after the subsystem prefix is lowerca=
se.
Could "add" be capitalized to "Add" to align with the MFD subsystem commit
message conventions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-msm8960-wi=
fi-v4-0-5ffa27aea39d@smankusors.com?part=3D1
