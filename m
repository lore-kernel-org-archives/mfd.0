Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C516D175A81;
	Sun,  2 Aug 2026 19:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785698070; cv=none; b=m5UJmpqiG9N3LKRDQO1D4Us0M8Czp6ZjD6qEB13Ghc3hhbIaAa5iL7fwUrOcmr2G8UU9Wo5wLHE2Ro+tDvEM9AEC4w06JOTEi37YYveNL8G7K26dnu6aitWk89wD5pYabzmOiEOdtkhZGL0d8AFRIMSDHw+PFqrRxC4YMVDWtuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785698070; c=relaxed/simple;
	bh=dHTOcHHSyA1KR0q7/2K93hP9eQfBLPcfWVEx4vA5n4Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H9Z6aKZxJ43wbO/DqKkO6ERpA1087LkWjpypoX3r5LuEObTmPHMiAUe6RftpvdniSrMzotpWKo3JOmWwVtZD2zPu//85neVRUjrerwmUonr+nLv96cbXkW7AhDD/1TT6GbV4+aP6j3PcZK2pYLQmXiD447+kGygX2RJn2DzIgfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNsiphSM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNsiphSM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A911F000E9;
	Sun,  2 Aug 2026 19:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785698069;
	bh=pl74VTqRlKAuC5ZFEDPjs23yhspVvnKcNxxnZGkw+fI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KNsiphSMX7ZinNegHOXtEu64xnVL+tLtoXfkqPzkC9FqL4S2Q6xWqlx9OwnegnhNM
	 Lh/K8ur7FVgPOic9/x/W0V4OoSzdrq3d5IfuMtl7F74oYE9RbLHdmQ9wbhb/A2fqe7
	 yFrt0qbSUHEnhA8cijkox1BpjW1drsCuLEU2MjIB6RqFtWI6n77hio5mz9YeLHYL2D
	 RdIlkF+S+1qYqWpt8m1yr0iBXFMqUTQAWHsB5jeL9UsW+Na+1CxA7XQwnpZajGRIri
	 7KU+dFdI4AJUcpU08fjS2c8Smuo8ynjEVuUUMwFA5a/A/A1vfffo2PnYc0qfrPn4uQ
	 DdTermumsX+Kg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/7] ARM: dts: qcom: msm8960: add SMSM & SPS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antony Kurniawan Soemardi" <linux@smankusors.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260803-msm8960-wifi-v4-5-5ffa27aea39d@smankusors.com>
References: <20260803-msm8960-wifi-v4-0-5ffa27aea39d@smankusors.com>
 <20260803-msm8960-wifi-v4-5-5ffa27aea39d@smankusors.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 19:14:28 +0000
Message-Id: <20260802191429.20A911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `sps_sic_non_secure` node is named `interrupt-controller@121000=
00` but lacks the required `interrupt-controller;` and `#interrupt-cells` p=
roperties, which will trigger a dtbs_check warning.
--

--- Patch [5]: [PATCH v4 5/7] ARM: dts: qcom: msm8960: add SMSM & SPS ---
commit b1991478faae0d83b35d683654faa3614f645d90
Author: Antony Kurniawan Soemardi <linux@smankusors.com>

ARM: dts: qcom: msm8960: add SMSM & SPS

This commit adds the Shared Memory State Machine (SMSM) node to coordinate
state transitions between the Applications processor and the Riva subsystem.
It also introduces the SPS SIC non-secure node as a syscon.

> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts=
/qcom/qcom-msm8960.dtsi
> index 9389b6358d8d2..0088381d77ea0 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi

[ ... ]

> @@ -458,6 +483,11 @@ clock-controller@4000000 {
>  				      "hdmipll";
>  		};
> =20
> +		sps_sic_non_secure: interrupt-controller@12100000 {
> +			compatible =3D "qcom,msm8960-sps-sic", "syscon";
> +			reg =3D <0x12100000 0x10000>;
> +		};

[Severity: Low]
Would it be better to name this node syscon@12100000 or
system-controller@12100000?

Because it is named interrupt-controller, dtbs_check will emit a warning si=
nce
the schema mandates that nodes with this name must include the
interrupt-controller; and #interrupt-cells properties, which are not present
here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-msm8960-wi=
fi-v4-0-5ffa27aea39d@smankusors.com?part=3D5
