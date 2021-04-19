<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Account;

/**
 * AccountSeach represents the model behind the search form of `app\models\Account`.
 */
class AccountSeach extends Account {

    /**
     * {@inheritdoc}
     */
    public function rules() {
        return [
            [['id', 'customer_id', 'user_id', 'last_dep', 'status', 'approve'], 'integer'],
            [['link', 'ref_account', 'create_date', 'update_date','ref'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios() {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params) {
        $query = Account::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'customer_id' => $this->customer_id,
            'ref' => $this->ref,
            'user_id' => $this->user_id,
            'last_dep' => $this->last_dep,
            'status' => $this->status,
            'approve' => $this->approve,
            'create_date' => $this->create_date,
            'update_date' => $this->update_date,
        ]);

        $query->andFilterWhere(['like', 'link', $this->link])
                ->andFilterWhere(['like', 'ref_account', $this->ref_account]);

        return $dataProvider;
    }

}
