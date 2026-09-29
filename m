Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF53C42586F;
	Tue, 29 Sep 2026 19:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710444; cv=none; b=Kwc2sV5TW5L7tfSwi6PV2+sOvCg+kzQ7O60F9/b/hyJYOLEXCvHOgcXpIr3m3QsNdkcJkqjgOV72fVNDS/Su50Rp6iLYmPTClzPx26mI2SIAc+IDrwNYCuDp1uvi3EBPnT/6mc89Gsd1en+nwZ8qjDBRjDlKkJfi5BQQFYUK1PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710444; c=relaxed/simple;
	bh=Ovh0uvdk0KhMJHCUcXKdB7oaDA5le4DTajCR348ZYNg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lklIWYgdoeu+1moXJQfHOiSF+/HLaERUeItKU1Ddkm9WTnOjZoWoYux5HI+9G6wtZH7GNtYkAWctqlL6D9ik95NJAQ8SJikfK7yhgR3BQFN8j6tBPKquE5E9ouOcaAZPAMgSPFaEbiBAngyZwL9hOa7tE2pwSpMNApZbu7SnovQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ViEH2bw9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ViEH2bw9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1911F000FF;
	Tue, 29 Sep 2026 19:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790710443;
	bh=Ovh0uvdk0KhMJHCUcXKdB7oaDA5le4DTajCR348ZYNg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ViEH2bw9cg0j/NVN3zr9wLPS3kMNaoVC4jgPcceQJ5NWDdIXs9zIkPPfWxD5VnGl8
	 oYp6G4ezLabS3O2b2QLGNUQby/00gUcBsf+9HBneW2VYigR4LCBxlwoPTWfTN6Tk4b
	 wxQbKZa3+iLXGkxHTyBM+YmnuLzFs/ODUkWm4bt9DPkmjAZ4RqjCy7jP8QBzlIN/45
	 CV/u8ZbTwRfIp1dvl0wM8cO2Qv93y8LHg52CB2wATFhWCC2HtOao5CnNVfRg7NUaF9
	 4dxsxZ7nq9DYcBSBCVmC2L/nBDJJYpUCVVM7Gw20LTyleO7Nod6DjFXqFk9jw1a3jn
	 BLOUxZXRt3eKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] regulator: dt-bindings:
 nvidia,tegra-regulators-coupling: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260930-ti-tps6586x-v5-1-aac0273b5da3@gmail.com>
References: <20260930-ti-tps6586x-v5-0-aac0273b5da3@gmail.com>
 <20260930-ti-tps6586x-v5-1-aac0273b5da3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 19:34:02 +0000
Message-Id: <20260929193403.5C1911F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Convert NVIDIA Tegra Regulators Coupling from legacy text to DT schema.
> Set additionalProperties true as this is shared schema.
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-ti-tps6586=
x-v5-0-aac0273b5da3@gmail.com?part=3D1

