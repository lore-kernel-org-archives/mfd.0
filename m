Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794245938;
	b=JiSHsCccbgADqiKZb9dIdSuEAay4JFctOkrpJD8rAYQv2imPYjTjH4HUynzGEKkSeAVT
	 feF84CQVUrqTBwhAiZuTHoQe+HnWQdKpzmsj3zSm5IVaceqjHxz4oC37SeV+fqW6zB028
	 AeSB7kMtVJ8sWOLvweVQPuGArCEuTA+qQhyFlm2bakUzgP9w1FUxflJO7WNFq/YHzUU3K
	 8iT0y+ZhvNi/pq1rhox2DeWBHyWodiSStV3fG75KfDW8R5o/2uBXiFy2q5ADFBvbwkbU/
	 9/gORBGIBE37oMAL7oObVjfVAw8JihSzaq0lHGzRoa3WqtaCiHnZBbrC6c5e4lg4BdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VSgAu1YCz0/TBDQtz025D2yh3sRQq8BFfiF0sq3qrAw=;
	b=02OZw2tK+AnpdunSOiVZ5mRO0V4xQa1JDnHjzf4FnlUIRDSlzz+djZfi2oknLVb0jHF+
	 jb/CRWu5RlLct3iJO8htQ1ljFxmjmkIWmPEWvaSB7TPtZ9vRlbKSO3JiPcf/GoljYCKQR
	 sRoG+7ATEAZ3Yd5mfm5AR5HiwuNxPpbM8hxoBlRX6Ruob952xuw9dJ02nLb6GnKi+ijlg
	 NZhhNsdrQmcYGHEyLhtOiV8HJmJeNj+PCc9PdUayEAYJsIYkfbm1dwLuqeUnlvAXqTdem
	 hdORyQyPv8IwoTMBfaVvUe1A0dAX87QZv3Z5f1YdDX3yehocG0JYe0SqH416VIYO/7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G8TniTJS;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD98606A333
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 17:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD98606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G8TniTJS
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso8238635e9.2
        for <mfd@lists.linux.dev>; Mon, 09 Nov 2026 09:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794245936; x=1794850736; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSgAu1YCz0/TBDQtz025D2yh3sRQq8BFfiF0sq3qrAw=;
        b=G8TniTJSDzLdXNXKCFglJKd93ls7/mt4l7pIe7aU++0BjFRLy+XtiWWP4QslsWWgcS
         ccYcpIF+HrxyTaIvtoy4lhvPWgNgdW0f6JmaVmEmOfhvgMNBeJ5+R6Lpv7xfpXju+qO7
         xH63NB7V9V0hWQYPwR4DPT4X4VSx/E7GoETJkpg4BRMXa4VF+vh5NCmzdgTLujHXUsH1
         eexg5UReMMs0qBWPBSa6goxJ++NsYTS9fYUFdM5PI/TuNRRFrXmJGWDAWH0/E0Gq8iVG
         j6gSu1J9pNwKgvjKZ0A1nly6FF2XxBAOo//5M+cKUZ5CTrAHsDhCNcOxK3ZOdv/yp8Zy
         Z2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794245936; x=1794850736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSgAu1YCz0/TBDQtz025D2yh3sRQq8BFfiF0sq3qrAw=;
        b=WnfnwcG/9l1b/7NkXikEjzceEtnkyzGg0OiTlLUhIp87qoyZWUTtm8x9BTOw8Gd4gG
         pDMgASC/s8KyUKs1ZYCpdQKZxbu5woR79xgpz1RiVaE0LjeDHasKhhG/UgQZuAxZYxTk
         Etiv4ZuMEGKapMpuwQFzfEdXCcOx9yO/JpZRKcIrcQ6Hrl32gpafips8IVCBxu+xc9EF
         vuXyB+EyU9gCL40gTQSCQCGNdn/H55I0csYTocZOuEZT/QSfijPVqHJKivUruGCcoc/p
         2oXAYUCXFtHHK4NyOmyTV07SmJaIR3ijSDHSy+vPnRRC1n0sa63KrdJ6DRK3A7jHoWRm
         Wndg==
X-Forwarded-Encrypted: i=1; AL+hErHUPnXN2F2tFtyOC3GqPtBlR109xca+ISTW3IoJqgFttWp/pCvZ/Pa1beTpa/4EPgasI9o=@lists.linux.dev
X-Gm-Message-State: APuU4Z8esUzvWpBDWwKCs5CL+DL/jYeszVdqEDrRHu0J08DzQjz8Upnf
	Bvt3zQ/JgDWC/8FhMBr4fwuZk7Olz6pYPS25Lo6zK0Tfa1u+vZ1OooD7
X-Gm-Gg: AYBFou2YetN+G2OPf3ttLGvUMKx02YcqMLzy4IGrVA819r7KAnLfLR2zaek/Nq9UMCA
	JVb30Ka8yM8n9TFkz+9wxp4xTR51jLM1C302A363rPG0sPaAYZdjoIcSSMO10JP1ePJlKqRBDoW
	8fAg/Idz496cl5oCxw2+vGWYRKSa8c0QoF4qqY4pIDEpSQ9wwMl/YMc2LY+p1PI7R2+GgochqNo
	Sgv444pLSP+9rJd/AjCMcR/JX44jJbB5UE3uU+jeShY94u5qkHWYU3jVpGmIMpdLyN8Vf3LIckQ
	DzNg/gyUPIDeCUahIGMZ8ywyqEBQMQ+UMNEnnTUVesgTtxN74EPJ1PS69SGkhTVD0powRU/7N5O
	Mo+cHLZbZeGWqpIOnr6Tcjq++uj51b7o0J/ECqV9PSFbr9IlUd0OJawNFE11JB4DYzmAEc65lf2
	KZIO7cFg9+x+JxoULphcQowmZFIwiCizsuCvTmDpYYolNpMVQzlEg+H8bjc6iGxjzn3cXm7A8nO
	Q1viWUncbbUpUg0ahBahJM4OGn6s8MZraCxX+yTBg30N42/4WLmrPZtjeV8r3rNP12iYZlTLHnJ
	LkdJSPjbR2fc1OqgWN7m6ct4NWQ=
X-Received: by 2002:a05:600c:608a:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4b94d76329cmr92154365e9.1.1794245936334;
        Mon, 09 Nov 2026 09:38:56 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0157b707sm2522005e9.0.2026.11.09.09.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:38:54 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Lee Jones <lee@kernel.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bean Huo <beanhuo@micron.com>,
	Stanley Jhu <stanleyjhu@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Georgi Djakov <djakov@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 01/17] dt-bindings: arm: qcom-soc: Add Halliday
Date: Mon,  9 Nov 2026 17:38:37 +0000
Message-ID: <20261109173837.2084788-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <78a88d4d-11af-40c1-b063-b6a4d4298ecd@kernel.org>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com> <20261109-halliday-dts-v1-1-289114ab8197@gmail.com> <78a88d4d-11af-40c1-b063-b6a4d4298ecd@kernel.org>
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

On 09/11/2026 09:25, Krzysztof Kozlowski wrote:
> This should be squashed with patch #15. Also, there is no benefit in
> organizing patches within patchset where patches to the SAME subsystem
> are split all over. #1 and #2 targets SoC, then there is a break and
> again we are at SoC at #15.

Thanks, I'll squash it into #15 and keep the SoC patches together in v2.

Stanislav
