Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4555D4A260C;
	Mon, 14 Sep 2026 15:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399322; cv=none; b=HEqOc4Z1E/Nlg3bE69bvOfe+GCzUluv9jwO0rgA425Ufd3ra/mBnYp99K8qUJK8OYvR0mM2dDYegXh8WCJeGKHQZVMf3fAy+2PPycO96E/soIAnjV4NRqdx2MTZPcoMQzzKO8yUHszFUmKnQyazliax7/tUWpc4qa5LHZyJSef0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399322; c=relaxed/simple;
	bh=D1ShA7Ja24sSwcQmiinuAgguB3eRDA7U5CDf9VVXPoE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bP0O45JsoeIakSN+QPPvirZhFyFcrPurr0fnEOKU0m7NEK/5v+HBCfmu1s8YiIdoW5UHfPWvaKHWvXvoqMf8JE+jtGktTU01wCuU4NT+sZCHbZzR3D5QppzmXnGqQxnxCR0evhHv3hm3SKe+OehsBJRIqnBCbgoQzUuajAEmi2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNn7psfG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNn7psfG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7951F000FF;
	Mon, 14 Sep 2026 15:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789399319;
	bh=D1ShA7Ja24sSwcQmiinuAgguB3eRDA7U5CDf9VVXPoE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DNn7psfGNOYma4An7p2BTPfbp1JmveaGGMaOVLsYJCLAIUsBJjdxLrvvS63f3rLjv
	 r57uyVusRUNeIzwdSL3VC4a+Ht6WhChbocSwidOgf+zstly3guw8akdwu8CXjzM1Kf
	 7VOvj6kt5NXj+tnXt0lXhw0UXvBUnfe0DCmnL2y5FYnzDBog4TkAgdtAzliDnYTHuZ
	 HTlDoAIjisq5vhHJ73UpHrermpj9Akm2MSa1zMl0TC9vC0Hf0w9E3a62/JLtHd3b2w
	 xyJMIpXeP2TCPNVm5RrfCI6jluxm3hy8aBva5ydUnNKZJg4xtpsizLxgW8QK2ntCN3
	 MnNEmpFF0y4SA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v25 04/10] firmware: psci: Add support for PSCI
 auxiliary devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-4-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-4-4aaf5c09b5c2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 15:21:58 +0000
Message-Id: <20260914152159.5F7951F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
> Currently, both the PSCI core driver and cpuidle-psci-domain bind
> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
> introduced, would also need to bind in the same way, leading to multiple
> drivers attached to a single device node.
>=20
> Introduce a PSCI auxiliary-device provider that binds to "arm,psci-1.0"
> and registers PSCI child devices on the auxiliary bus. As the first
> user, register cpuidle-psci-domain as an auxiliary device.
>=20
> Update cpuidle-psci-domain to probe as an auxiliary driver and use
> the PSCI device node for power-domain traversal.
>=20
> Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> Suggested-by: Lee Jones <lee@kernel.org>
> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-arm-psci-s=
ystem_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com?part=3D4

