Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463876;
	b=ui4ufL4OB9TAh73UwtGhbWEGBb/Edn7dvfW9SrQdtKsUKPtKZxiSo5O3RFXs0DtsUEky
	 oSSs7x1gKWPZ/sZ/tV4mpC1qQarbPXCbiApc42IoDIF+rqJNq2kc9vTPvWJbOOc5tSDtv
	 azjOSySCoVAlGY7kbHpsUKpD8F1cTFbRnTOpysQ4wiLB8ATSVHE+tN0ipf0fBan1eiDuu
	 r1xtZjzrv3H85MuudQsMjYn8BsPkzQlZzhNLwhEr+B9gubzfkx/o6AB4p+/KkN+ZZ/ZD+
	 +WFixsCKCrIvB+JiV/8Xgj9YoCwoRgR+bWKkFx4V3TmyAgvRJOWTqF0vnpnTgM2rTJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=6exMPjzPlDYktg7Qt1ZlrxsNxMuURpKWW9XowflKwXc=;
	b=van1IWZlQniWMuBtyUYvB1Ho129rphz7wER9Al3H0fSqEgPACb/eKGHmEyMOX8l7qouR
	 V6PcJpnE2yM68plmpwZhC8AzojkWGIzqcBEdib6CLAODSR/723Cm54sgtV0onlb4kZRm2
	 9qG8QVdZp/7Em2t6/6wcDkXeOoNthWNlyRIIroES9Io45130icmkAIWSDNwkdnwC5skzz
	 dcQ5J0Mq4DXeJHTMxUFZkeilM4M7AUwl5rTi3nDZb1x4mxFrdMZt3jRNhLyzQ6qlUF2pW
	 hxE6Q26CiPwFLf11GqcC3J2DqBQmxfo/VEOP2UWo64BgVHmCa3XY4X0IrgFQJLSTF2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aHw5R90f;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413BA606A325
	for <mfd@lists.linux.dev>; Sat, 31 Oct 2026 16:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 413BA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aHw5R90f
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9440304604aso183066885a.0
        for <mfd@lists.linux.dev>; Sat, 31 Oct 2026 09:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793463875; x=1794068675; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6exMPjzPlDYktg7Qt1ZlrxsNxMuURpKWW9XowflKwXc=;
        b=aHw5R90fCuBq+4+Nekk1/3P8maPIuLjCynIyNWh5lXfnErzJn8hES/ePYB2aRqpZMx
         D2QWaWA9/KmzCgGjL1kY84hNoudMDLLl6eA1RwLKXEHv/3+KoFWHbYirwCH3VZlRon5T
         TAAJFdDQjth5XFQ0LqHJaCxGFj1ORm9DSg+Z4Ncf9g4YyUUcrfVsU21WFBnHTXX0E9Wa
         uGMHC1qVffWzFinb985b7a4+O0fmoRI/oosfBPuqPLUKJ+Eplt28Ek4mDwqOBPrWvCUN
         pMQjw8rOYwxB1lFaIfoAIJ3Sgi2McA/k/oF59Ew9TheNBGNEnTwYcSBxlrOnULJ8JP7h
         Sy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463875; x=1794068675;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6exMPjzPlDYktg7Qt1ZlrxsNxMuURpKWW9XowflKwXc=;
        b=Rj7lZc4U809Rb1XQtj2v4KKtTCTM+i5L4ODHKvsylm5Ci2jITTXFKd1OcqwCsmc7HX
         ndhZE2oud5Lh7W+xIAvIuNVIgUVp/YgKbpGHF2e5hUhTi7BMV4OMsNLkOdsMo5HjEhgt
         GUwjTSj5WXjn2mWE76P4weMIFjI5v/WRNuMzvfMyFrXy/tyLe5G+j4i0tKydFsOiRRsX
         /YfNC3GZ666G29Y7A2ahP6jRIZbq4lMybDsxDd/wp9w/wDQksdwJ8/uSUgdcochY5nJb
         IB2HMyHOuGSV5NPmu0byyCf+Aj5fX8MHgg+g8lejIyUV8tDnJ6gW4hIrvpwyABUcizg4
         3W7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzZZ/NT7CYPOryzpkQXQ/9ji6U3yGgiBj+WpY9hTXGy4yr00t8cRmodUYKDE0krK+rFPsk=@lists.linux.dev
X-Gm-Message-State: AFq9FYLoP4XUQTzMIjRTpCawUrmq95GF0RnJEz2EUeNWeOWTE+cbR481
	L2u70TB1Xapc6owuxckba8PKyExp0qHl7tyg2v9iCA0tAK/Z5Ofb0amn
X-Gm-Gg: AYBFou0LTX3oh4O03AHHnMcy3Z9rlwp8lU3hrqCUVUUwOLx9x7j8ZiSeFERQ8ELBQYy
	C8KwlVz1My1+tChmNLmh8mkf41OH/l9TaSpDjoXO2N/EIIkK8ksBEfehALBxfs+0fDoWOyaax0p
	YMUakP6v/5q//38xjX6mQBjcMjcIzBd/SzgLdS/wGzGQm1FnUdI/rg7wE6wdJ44WIFqfbz99OzW
	g8FyifZ9GVEulKXFN/jLiBM+ej69eX44Tj4XGkBk0O5k2Sm9AQpVo5Rq5peJKowxo4XTAhfr8cQ
	xbGZhwnJXkrSpbjhyUUHygWlsaiBecyOHntRpMY0X05sDM5AEBj4fKY1P7Y+edbgM1pi13saLRu
	L5TqAr4wDsi/bjcJ6joT2saVhHHFj44xvFS30VhwWDz1eXC279MzzbjR6xkyGrsIb/UWoT0UreL
	YseMLYmnygdLfdoH+HKexWLCdFl+dLgsIU6Q4x/LwpZZAzH4L6ZhIZ5UQmOltXpztzlwFIXTuSm
	Hblwt5BIw1/uWJ1ZJsDGAg6CFsSDu5B6fQTa8eURSdlMwoy9lsTqM24TECbkg782+ct25StMbJg
	7FTNMxMq2b1M5J2bBf0tMHACZNMHrJZTNFj+AiBOXoFZUQTnISvdiOeQur/8wgCxM/oy5nsRyaS
	8jBar2Q==
X-Received: by 2002:a05:620a:1999:b0:93c:891b:90f1 with SMTP id af79cd13be357-944133ab8aemr1377062085a.26.1793463875288;
        Sat, 31 Oct 2026 09:24:35 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425ad7431sm414076885a.40.2026.10.31.09.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:24:35 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Oleg Keri <okerixx@gmail.com>,
	Burke Cates <burke.cates@gmail.com>
Subject: Re: [PATCH v3 0/7] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Sat, 31 Oct 2026 11:24:34 -0500
Message-ID: <179346368316.44447.5094215662368347048.x2e-share-pm8010@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)

PM8010 at 0x08 on i2c5, no interrupt in DT: it probes, and its
LDO4 and LDO7 power the front camera (ov02c10, 720p at 30 fps).
