Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63CF49C4BC;
	Tue,  1 Sep 2026 20:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788294630; cv=none; b=e7iwazljrjqnnbHcC3QsywGm28yWE8Zqxm9blEiZnW1j3t9CdE8T4wAOgnguFRfVakeiHCUJ2yxP+TiGOR7cWviRvoLMg4M7otkckOJzP+vnHHAGRkcJs1LdQEmhYScyFgrb4mGY4kqTdHL2Ij+JK+ryOhOI4e6MqqvN8HkhY40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788294630; c=relaxed/simple;
	bh=fNfC0MAiWSKAmJgEzKqgaJMezeAOVzGZerq/WyYrRYc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n4CZxBhgBcAhoqIHoltvSj2VEGNCieyn0uCE8jsbFUtnJWCv11LVn2MuhQuB5E29dCL3m91ZsIUhvzm3N/fsa2gy/0cpSK1jgUTBTpYK8SPhvroz8O+J/gmn+eDo9720DsJJ27moemCV0KCi1isdTiec5aFzweNC+mqQxd//MI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DneaoLTr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DneaoLTr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8B81F00A3A;
	Tue,  1 Sep 2026 20:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788294627;
	bh=fNfC0MAiWSKAmJgEzKqgaJMezeAOVzGZerq/WyYrRYc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DneaoLTr8U4zdkQXhZkdKCv+JMgUACYfMYrwQxRuTMIgKjQh6da9eCnyCCwtXpHwV
	 tEYNB1aE5RzF7ZwObGDYgpLn2fSSLqnR9vYKqbJN6jHW6VLHpoTIvVVh2xL2BDmTAb
	 QrDoPM4HmkgVqOfJcwjuQRxpdt2jn9drXum6inEs1paxeqaN1+218BICjAvi8S1zMn
	 ZjE+aAqZ5AM6f954XHGGCjLhC/c0NvsOId72i8OHX0aRrZ5MWqw2xYqZvps3+FE7Xw
	 S9SAe8aO4VHABd9dQZcFL5kHyEEJqjy4VKTuHMFn3QNtLSSbACRrk5nRphHPqLjgNJ
	 jibGVw7wc8zuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/13] dt-bindings: mfd: ab8500: Add regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260901-ux500-dts-snowball-regulator-v2-8-fe88b01829bf@kernel.org>
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
 <20260901-ux500-dts-snowball-regulator-v2-8-fe88b01829bf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:30:27 +0000
Message-Id: <20260901203027.6A8B81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The buck converters were not initially added to the device tree or
> drivers as they are mostly always-on, but their outputs supply devices
> which need to reference the correct regulator.
>=20
> Describe the six AB8500 buck converters when the regulator node uses
> "stericsson,ab8500-regulator". Describe the AB8505 converters under
> their native VSMPSA, VSMPSB, VSAFE, VARM, VSMPSC and VSMPSM names when
> the node uses "stericsson,ab8505-regulator".
>=20
> Keeping the two namespaces conditional on the regulator compatible
> avoids representing the distinct AB8505 VSAFE and VSMPSC rails with the
> AB8500 SMPS3 and VAPE node names.
>=20
> Assisted-by: LLM
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-ux500-dts-=
snowball-regulator-v2-0-fe88b01829bf@kernel.org?part=3D8

