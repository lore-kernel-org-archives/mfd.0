Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011077;
	b=pFwgDE0ER4NA01EBbxF6iybSXlFfWCL1Jat55wBEavVdthensyzsxohA3xP7wJrinAzB
	 f5PhY+Yupzw2PYKJ+0hV58xuBz5jzKOzQhwOtNncuBOGtZDhD1Ls3iIELBm//39CwWRI+
	 ieeZT+GcrR4Com+MyKnKRCe9DlG6g4/iOpXmY9hsYMOdIdHDIz59KBw0RyZS2HbIaaiVk
	 c2lmp1GU6KC6CyF6fsP9ga5sXR2ANMMhZvqc7vfzKuO46HqoCe/7/LsDtXFraanSCspP6
	 19St8bQ05FlfUhd+suax0gKNzJUeJIEzpPYJ7+Yw92v+02wmz5WG5QSaAh1ElPlVFkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011077;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DJgH4vIIf35CAgbFfjS3mre/jBxe/NozKb/HET6Fv1U=;
	b=PkZz+voHakD8q0iaFvRSHzrtwP01AvjUxb/pmzPs1Cvz05F46zgtbjE4853wi1KlFGn2
	 noeMHU5QyLWVCFbX4Cv0rbsGa33WCl8XECvikWMT+Im8NhN9xTJu7E8pA5nQbzl4vpcIN
	 yBHGV2I9gbErka/0wFYtBhzFVVYAF2wMlUoWzMxyq/y3ENUMKP1l78WzaqOa/4EW/jGfc
	 qSOj9U4vJ/RaDc+tAilSMNtUwJkA5GcmevP/kCJr6TAfbHuhGw2PjRaAH278I+f5RXD0d
	 qViOb2JxElGfIVi1ylyApZIXionWIJK8Bwh4JQI2vZo0nVzOy7m7yK8YFMXZpMdE9Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YQaLHxw0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C43D606A326
	for <mfd@lists.linux.dev>; Sat,  7 Nov 2026 00:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YQaLHxw0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B021F008A1;
	Sat,  7 Nov 2026 00:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794011076;
	bh=DJgH4vIIf35CAgbFfjS3mre/jBxe/NozKb/HET6Fv1U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YQaLHxw0ieIMSP2giE0+c37JaDyTLTarYeo8Oh9s+5JUoMT8MgCm7aZNqF6vkfaUP
	 LbgHKgW3Mt1AmQ9nJidwwT/+9wK97y3V0Ojmne3Qc+r8sLPvIOS3oM5KJ27T8aqnin
	 /8ksszdAcq+cYBjUJDnw6d/NKirwt0eqrU5qsY9YbBJwP3qFCrgFYi2W6XgrTUUNM6
	 cHooPHXsOL0Dkc7Gf/443T4Lh3wZ1mvScfqnaAPlZF6xgT2pxpI8QdkbIS8WMZZWio
	 mAUO3CfrXA+ImIJ+D11sMRK3djyQrZU4jaYdtNPYl8R5K5uMNEPyzAN182wUPY0Ucq
	 mD6yaWGJBUy5A==
Message-ID: <sashiko-outbox-202421@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] mfd: qcom-pm8xxx: convert to
 subsys_platform_driver()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Brian Masney" <bmasney@redhat.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261106-mfd-subsys-v1-1-1c3e755d37a6@redhat.com>
References: <20261106-mfd-subsys-v1-0-1c3e755d37a6@redhat.com>
 <20261106-mfd-subsys-v1-1-1c3e755d37a6@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 00:24:36 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] mfd: qcom-pm8xxx: uncapitalized commit subject description
--

commit 49060bdb25dc221484f1b98aabbb4273d1c20f0f
Author: Brian Masney <bmasney@redhat.com>

mfd: qcom-pm8xxx: convert to subsys_platform_driver()

This commit replaces the open-coded subsys_initcall() and module_exit()
functions in qcom-pm8xxx with the subsys_platform_driver() macro.

> mfd: qcom-pm8xxx: convert to subsys_platform_driver()

[Severity: Low]
MFD commit subjects capitalize the description after the prefix, so
"convert" should be "Convert":

  mfd: qcom-pm8xxx: Convert to subsys_platform_driver()

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-mfd-subsys=
-v1-0-1c3e755d37a6@redhat.com?part=3D1
