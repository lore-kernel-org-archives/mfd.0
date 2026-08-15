Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB681A7264;
	Sat, 15 Aug 2026 18:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786820376; cv=none; b=VfCU3eJC2e3pVAqjGJCDja3pxOU816dD525qrfmCNjovLlLAjWXVs8A6XxB2tBa1ZSV+2XQoAjEF1NV2fmSZ/WbDJSLuQxj005g60PQ+bQzyxLJfCfs7mv7MiJEypZkYDJnnR3zwJWPqwMGwtdn9enVGz15JVnYH/DvXCfhntKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786820376; c=relaxed/simple;
	bh=Piq/CrNKIeLjH9nK+k4IxP//YnNav5VcvDB5NxNovJg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BLKkje6b7a1cOakG7hxXgNtuXRbKFsfp3VuXrki7ytnu0pHLueXMyrZ9dCAi4ZrzTqUd7GSwub+ZPXLoImgjiwZVZC05oyuvKY63vv+kVUqvmP+5fVIEHxRwahNSjeGvUuoPosBhn9Hbv1UtvdmVT8UwPJ+IYfV6pD3DJdE+gs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1r/pxcm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1r/pxcm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A871F000E9;
	Sat, 15 Aug 2026 18:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786820374;
	bh=Piq/CrNKIeLjH9nK+k4IxP//YnNav5VcvDB5NxNovJg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S1r/pxcmQcSTCXlbtC/GOoUWA7NTAxQq+gjvR07KdAsVJOzZGwXrEW6OM3bICnapK
	 JVDTblHaWdIlFvYEwQ3PZ/ZqNM8+qHcEQAmUvoiDJ94txJ/UsPBX17C4qnwqcpW75O
	 zfRsjmn6WocsJ7TCFNzcOjHVMFWsIts3Lmg+0QujzzxHTd8NEO5ZrSkxLleqCeZexz
	 0ETovKuZPmfRSUqNREFHRFhECpIDnduaWOiOoeIk1P75M4UhCWrF+Q8SX0yZSd+0nf
	 7kuT2gBrsi64hGCmibvHwoI81sfgOvbX5F/IcFbzVPT1pKH4DrfjQi75YpTlj71Ltz
	 0msXKEPIOeJsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] ARM: dts: ti: keystone: Align devctrl child node
 names with dtschema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: robh@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260816-ti-keystone-devctrl-v2-1-5ab1e13c15c1@gmail.com>
References: <20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com>
 <20260816-ti-keystone-devctrl-v2-1-5ab1e13c15c1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 18:59:34 +0000
Message-Id: <20260815185934.82A871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Align TI Keystone device state control child node names with standard
> naming conventions.
> - Change keystone_irq to interrupt-controller
> - Change keystone_dsp_gpio to gpio
>=20
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816-ti-keyston=
e-devctrl-v2-0-5ab1e13c15c1@gmail.com?part=3D1

