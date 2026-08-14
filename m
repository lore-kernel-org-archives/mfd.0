Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9F739CD05
	for <mfd@lists.linux.dev>; Fri, 14 Aug 2026 21:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786743236; cv=pass; b=bH0aDGc+6xotLlbIxd0MKKxl+dJq6QfkjIZtT7Kh3kFSbw0EFK1eksXyuUlUKUlpvuMtAAuJRyB/wBBSMM7pLdW9XCBLivLUkkG1Sv8P+f69o5/339c1yOVRatKE9r7kWtK2SvPj2Nh/MhUCQZTYiHqDPnkh7350kOmiSadqm6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786743236; c=relaxed/simple;
	bh=bF//maFhRDVTJClT6VlIKy7W5yILeHbfc8S+gFxhrTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rKD1QHvKI2stzGKl/bfNn0aHa6okq7bRHW5nDtHSmWQjMWx5/btiQql8TvIwY7MElcLZ8732R9VwV3UMAJeax5tOb/6A60jnwD5qcHgu5cF8H+fearyNMB/aSPA/iT29aszyaoPBZOZ6d77yOM2eNTvcLFzND2RUnez416UdaQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fm07JK97; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fm07JK97"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15e62c695cso13373966b.1
        for <mfd@lists.linux.dev>; Fri, 14 Aug 2026 14:33:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786743233; cv=none;
        d=google.com; s=arc-20260327;
        b=eneBA6U00dGmm7mpFopRxvnQkOKgzhHGUIGQboV5ynLnkTrBTLfmnPZPmXpBrLMim/
         APQyt6SPsnvYOCrUnmpwsoiLpZSDYQtG8jEJ6wjvOwlJQh125eE0jqk96FDQFtRPHlA4
         +XvHrThZKrKjgos8mBGSHRUe1XRrDmsUJ9oxMxyGibz3nzGTsfJTocrQPumTQckCPkAA
         rYsQAioy+MzoLzMdE/0/IerGaUviSlVh2+523a9ZcAHF3OHwQwQ2tYVa5rX2RVPR0gnw
         yY1euE6smmQCr6aoBAdgCK/s698ptKpQOn2Q84fdtW0JTWU4M+dmyCi/yZNFaO7Cjl+p
         EaVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bF//maFhRDVTJClT6VlIKy7W5yILeHbfc8S+gFxhrTk=;
        fh=9h2jdGU/f6RBSfwYxaCfTlLe0hrcXl+qqAnioKXjqsQ=;
        b=UTuzz2yJwleMsE772lkKMhjBkqNoBUcwyhDNvF2il4E6VhYkQ7KbemX0xTVXR5yROL
         F/Z2Xpbf4gIynFpr37J5+L6XJRi3V3b3xI6TzJ81rBkEKIQ2pi8mzVda7dM2vBJTn2fs
         qeef9lTJw21xHAty8t4erpBkJ0lqF4xg+/kJjX/ilT+yGY+rnAsmQlJyxDo82QIZW9ty
         PLyc7rqe0d3skspaLYbRQ0xqmmWpDy2VeTsjf+Wby/qay33k1MPIfAjL1WuNlPry1gs1
         xkS9GqQJeBVJueL25QE7yj9b7K5jgfXg1B6Bybks9jGKlrE4I4vezPp1sU68Es88Kmm3
         0mTQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786743233; x=1787348033; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bF//maFhRDVTJClT6VlIKy7W5yILeHbfc8S+gFxhrTk=;
        b=fm07JK97OK7jlIzf40ewuzaJ5o2/xJHn7SjeqM4ByLWw4iEhmO239/Hz+d5Gp9cGK2
         cP0OKSjPyR3sadfu3kOD9rlYJLi6FJj1k1pORU/5K/82sNbY3Pj3Np1Xd7U2hwk2X2Zf
         ZeGf4V6XO5VUafHGD/Uw/Gwz9T2VxSXADdOWmh0IEZMcfiSJ41BpBLVlTXB3eDpAf9/K
         5gkhAC3pUuB3ZifJmvfRGopficiyAQ0I47Un4dtujILkTQUALXbT+nPOzWrUrBnMmPEM
         hO7mdyoRjzQhMxYSQh7UhU5wExGbK//EuUv2AcKQclfWZvQM9j8NUPmr9FJEWjHo+Y7g
         9xGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786743233; x=1787348033;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bF//maFhRDVTJClT6VlIKy7W5yILeHbfc8S+gFxhrTk=;
        b=KQAq/UlA1LmbzRbHNfq08NqAC9+3G8Ui7QN6KMvMjEtLQNTnuidP2r5VgTjbcJQECR
         Yoct7a6qBW+mu43XQoIl6ps4ZH+M2fEdTDZE+saAnNWUPyJxrLJEtu98eJHtAOvyj+JM
         dPotGsjn8UprqkxhraEH6ABV9EdlFBMWiYSj7WzzIrpt4XuuoLsMPjqal7ghOhlC6IPg
         yVq+JEfGpnpwyUdDS9qqbL/q4Ixvl6wOaeIJlgh1KP8UzVf6F4IX3c10c8e4s9IR0aR5
         Xj+or2cUE4Gx4rIYBapVMCttPSrp5vWyDdBBJTZPu8IYXqlFsaToBlD9ueeMeCAPoQ6w
         X7Nw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3QnMhW5nmWFpKghShZ3nsD90zDYH/BxU6enBBeAMkFHI1ntbxusHsQyOJ2hJC0Js+f2A=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTh0T7alsx1O4mE9+6a9/YCKZ02HcdAd21hSUVjcGn/E4+LSdu
	Yu0dLaYrB72BM2tWSlimJxfAi/Aw7m3Cziv0IfonqQq/27/aaig1PDBXrat9C39+DjQ91UGVYzu
	c88Rw4Xc3pL4v3WKRK4Ma5EQ+ZZP4t5M=
X-Gm-Gg: AR+sD11Wo/GpzHhmxwtyqTKgBtw0XAmf2pohmBFZGx7lUlNk83wR80T1MBnJ5DejMN4
	aMf7bDP7LydmkrELv7CI9I6f2MYgJO0b+XiUUkmALmwB9IM5zOIVjTG6McKIhFJ+lwVG7gjMS/+
	MPjZW1yH5eeDMLucygzDp9ti5khcUrROA7CGyVo9+ej5XbmesTn8lHejUuK0sH1wYGRSTI5a5fu
	cc9CAxvrh8EEbqlS5hMj9R9QEUmQ7vWLYhACqiEqi47cRfHofpwcc/XmJMmS4SlB3OaTGNuommL
	PE96ukyXF8wi6NZdR/Y8sZ0Vv05E7eFQM9tnW2DJkLsxZJiN9xwCvIaqa3EcmWfFeJnA3m7DWgq
	Ie1I=
X-Received: by 2002:a17:907:3e9b:b0:c12:732a:fe52 with SMTP id
 a640c23a62f3a-c212a26d6a6mr212990566b.4.1786743233242; Fri, 14 Aug 2026
 14:33:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260813-ti-keystone-devctrl-v1-1-6f0aa87d9af8@gmail.com>
 <20260813164117.DE8F01F00A3A@smtp.kernel.org> <CAOWyW_6Wayw0gKMyhpy2wE6oSbikM3fKCopqxHodddM9zt1-FQ@mail.gmail.com>
 <20260814-wild-dog-of-dew-3ccfe8@quoll>
In-Reply-To: <20260814-wild-dog-of-dew-3ccfe8@quoll>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 15 Aug 2026 03:03:41 +0530
X-Gm-Features: AcwNN1Uy44KKTceDwDiBJV_p4AQtngzimLEUMzkno-EHQhuKCEBgyeAvZt7maU0
Message-ID: <CAOWyW_7NL1GeWCTu5LED4avsRLMOHMs1kVxGN0r+MxMhHSj_AA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, mfd@lists.linux.dev, robh@kernel.org, 
	lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 12:18=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Thu, Aug 13, 2026 at 10:24:12PM +0530, Bhargav Joshi wrote:
> > On Thu, Aug 13, 2026 at 10:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote=
:
> > >
> > > Thank you for your contribution! Sashiko AI review found 2 potential =
issue(s) to consider:
> > > - [Medium] The schema enforces non-compliant, legacy device tree node=
 names (containing underscores) for child nodes via `patternProperties`, bl=
ocking the use of standard generic names and contradicting the commit messa=
ge.
> > Yes nodes with underscores are kept not to break older dts/dtsi files
> > which uses underscores
>
> No, you made them ABI now without explanation why this is needed.
I will fix dtsi instead of keeping incorrect child names in binding in V2
>
Best Regards,
Bhargav
