Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30935175A62
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 10:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974426; cv=none; b=SUDfDP8Pa+NkLOQleGuSjLhPrWXF6CcsEjdId8xYYNt/Iy6uZU6186/F/Gk0rqRGIyQO2/WC3NP8NW+ocMYX73sBxGPGZzufziqG3NwgrQqkEG3yfrzymAUdQY2XXZ4ZSkym8jvxCgidQG1Xbb0RGVwG3cdMVN1oI8DQhbLenG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974426; c=relaxed/simple;
	bh=NuzxYCCJVFHveb/phbs+s/kg8vA1KfHZjfwclKal5S8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=eI+OGKcZDroOTwz6rXKWGnJ72um1EBPgwyMid4w15UtXjB2dXdno1UkLtEpAZPWjnTH4B2/jVofDJT6TJzzcMoUAQu1EsxRVuR5SHTtWr28bfd1gX+KYkFa9KZq+5i4AynlvTS5MPvq7iD/S/10hDHJJaSFYJH6nESPH5V90kzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6iBRN/g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6iBRN/g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7511F000FF;
	Wed, 14 Oct 2026 10:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791974425;
	bh=NuzxYCCJVFHveb/phbs+s/kg8vA1KfHZjfwclKal5S8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P6iBRN/gSI3yQP0Dsr+EkBS3852qpcpiaXcV13ZzJGfEawtVnj9t5MbQeetVT8cmo
	 SxPD/oqqRTTDaU1xtnKNJZ9METtQ7MtUSfi11o5Z84FUnNIdzvnLohyYWJa88COuZa
	 9xBKOjAV/vBX9quPxFr79ulCSw4eY2NEpKoyJuxRts1Qb5hZsebo+QvZWlj28XW6ng
	 AmHUT51SeKMTIbIRnr++O+nvsHoxtsr0F4PJYY16YFTW5U+dBvvY6X7FT26h7738F5
	 Zk0g8kNy2LaUCyCsWGJHZJIIELp2Jobka+nVkE8l/8IR7CazCnk1zh2rQoR4LOc6d+
	 tpVxyVyOhBlRQ==
Message-ID: <sashiko-outbox-171150@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 10:40:24 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> PM8010 is often wired up with the interrupt pin tied to ground. Only
> register the IRQ infrastructure if we have a parent irq.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-pm8010_i2c=
_support-v2-0-b395d2b3f668@oss.qualcomm.com?part=3D7

